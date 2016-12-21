#!/bin/bash

while getopts "s:h" arg
do
    case $arg in
        h)
            echo "deploy shell usage:"
            echo "      -s server hostname (e:www.runningdoctor.com)"
            exit 1
        ;;
        s)
            SERVER_NAME=$OPTARG
        ;;
        ?)
            echo "unknown argument."
            exit 1
        ;;
    esac
done

# deploy 根目录
DEPLOY_ROOT="/data/deploy"
# 项目根目录
MOUNT="/data/"
LOG_DIRS=("nginx" "php")

if [ -z ${SERVER_NAME} ]; then
    echo "no enough argument: "
    echo "      -s server hostname (e:www.runningdoctor.com)"
    exit 1
fi

echo -e '\033[31mPlease make sure php service extra_hosts is filled correctly.\033[0m';

# 初始化目录
for DIR in "${LOG_DIRS[@]}"
do
	LOG_PATH_NAME="${MOUNT/%\//}/logs/${DIR}"
	rm -rf ${LOG_PATH_NAME} && mkdir -p ${LOG_PATH_NAME} && chmod -R 777 ${LOG_PATH_NAME}
done
echo -e '\033[32mInit dir done!\033[0m';

# 拷贝密钥
cp -r ${DEPLOY_ROOT/%\//}/volumes/ssh/* ~/.ssh > /dev/null 2>&1 && chmod 600 ~/.ssh/docker || { echo -e >&2 '\033[31mSsh key copy failed.\033[0m'; exit 1; }

# 克隆项目代码
command -v git > /dev/null 2>&1 || { echo -e >&2 '\033[31mI need git but it is not installed. aborting.\033[0m'; exit 1; }
rm -rf /data/www/htdocs && mkdir -p /data/www/htdocs && cd /data/www/htdocs
git clone -b new dreamix-git:tsb-chat
git clone -b php7 dreamix-git:tsb-passport
git clone -b HX-release dreamix-git:tsb-web
git clone -b php7 dreamix-git:cola && git clone -b HuaXi dreamix-git:tsb-server
echo -e '\033[32mClone project done!\033[0m';

# 获取mongodb and mysql username password
MYSQL_USERNAME=`cat ${DEPLOY_ROOT/%\//}/docker-db.yml|grep MYSQL_USER|awk -F ":" '{print $2}'|tr -d '[ ]'`
MYSQL_PASSWORD=`cat ${DEPLOY_ROOT/%\//}/docker-db.yml|grep MYSQL_PASSWORD|awk -F ":" '{print $2}'|tr -d '[ ]'`
MONGO_DATABASE=`cat ${DEPLOY_ROOT/%\//}/docker-db.yml|grep MONGODB_DATABASE|awk -F ":" '{print $2}'|tr -d '[ ]'`
MONGO_USERNAME=`cat ${DEPLOY_ROOT/%\//}/docker-db.yml|grep MONGODB_USER|awk -F ":" '{print $2}'|tr -d '[ ]'`
MONGO_PASSWORD=`cat ${DEPLOY_ROOT/%\//}/docker-db.yml|grep MONGODB_PASS|awk -F ":" '{print $2}'|tr -d '[ ]'`

MYSQL_USERNAME=${MYSQL_USERNAME//\"}
MYSQL_PASSWORD=${MYSQL_PASSWORD//\"}
MONGO_DATABASE=${MONGO_DATABASE//\"}
MONGO_USERNAME=${MONGO_USERNAME//\"}
MONGO_PASSWORD=${MONGO_PASSWORD//\"}

# 修改配置
sed -Ei "s/server_name.+?/server_name ${SERVER_NAME};/g" ${DEPLOY_ROOT/%\//}/volumes/nginx/sites/server.conf

cp /data/www/htdocs/tsb-server/app/config/config.php.example /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['passport_url'\].+?/config\['passport_url'\] = 'http:\/\/pp.pro.com:8000\/rest\/v1\/';/g" /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['memcache_244'\].+?/config\['memcache_244'\] = 'db.pro.com';/g" /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['memcache_246'\].+?/config\['memcache_246'\] = 'db.pro.com';/g" /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['memcache_252'\].+?/config\['memcache_252'\] = 'db.pro.com';/g" /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['redis_249'\].+?/config\['redis_249'\] = 'db.pro.com';/g" /data/www/htdocs/tsb-server/app/config/config.php
sed -Ei "s/config\['redis_250'\].+?/config\['redis_250'\] = 'db.pro.com';/g" /data/www/htdocs/tsb-server/app/config/config.php

cp /data/www/htdocs/tsb-server/app/config/database.php.example /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "s/'host'.+?/'host' => 'db.pro.com',/g" /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "s/'login'.+?/'login' => '${MYSQL_USERNAME}',/g" /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "s/'password'.+?/'password' => '${MYSQL_PASSWORD}',/g" /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "/mongo/{n;n;n;s/'login'.+?/'login' => '${MONGO_USERNAME}',/}" /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "/mongo/{n;n;n;n;s/'password'.+?/'password' => '${MONGO_PASSWORD}',/}" /data/www/htdocs/tsb-server/app/config/database.php
sed -Ei "/mongo/{n;n;n;n;n;s/'database'.+?/'database' => '${MONGO_DATABASE}',/}" /data/www/htdocs/tsb-server/app/config/database.php

cat /data/www/htdocs/tsb-server/app/config/database.php && echo -e '\033[32m\r\nModified server config done!\033[0m';

{ \
    echo "DB_HOST='db.pro.com'"; \
    echo "DB_USERNAME='${MONGO_USERNAME}'"; \
    echo "DB_PASSWORD='${MONGO_PASSWORD}'"; \
    echo "DB_DATABASE='${MONGO_DATABASE}'"; \
    echo "REDIS_HOST='db.pro.com'"; \
} > /data/www/htdocs/tsb-passport/.env && { echo -e >&2 '\033[32mModified passport config done!\033[0m'; }

cd ${DEPLOY_ROOT} && docker-compose -f ${DEPLOY_ROOT/%\//}/docker-web.yml -p web up -d

docker exec -t php sh -c "php -r \"readfile('https://getcomposer.org/installer');\" | php && mv composer.phar /usr/local/bin/composer && chmod a+x /usr/local/bin/composer && cd /data/www/tsb-passport && mkdir -p /data/www/tsb-passport/bootstrap/cache && chmod -R 777 bootstrap storage && composer install";

echo -e '\033[32mDeploy web done!\033[0m';
