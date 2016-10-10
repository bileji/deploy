#!/bin/bash

echo "\033[31mPlease make sure php service extra_hosts is filled correctly.\033[0m";

# 初始化目录
MOUNT="/data/"
LOG_DIRS=("nginx" "php")
for DIR in "${LOG_DIRS[@]}"
do
	LOG_PATH_NAME="${MOUNT/%\//}/logs/${DIR}"
	rm -rf ${LOG_PATH_NAME} && mkdir -p ${LOG_PATH_NAME} && chmod -R 777 ${LOG_PATH_NAME}
done
echo "\033[32minit dir done!\033[0m";

# 拷贝密钥
cp -r /data/deploy/volumes/ssh/* ~/.ssh > /dev/null 2>&1 || { echo >&2 "\033[31msh key copy failed.\033[0m"; exit 1; }

# 克隆项目代码
command -v git > /dev/null 2>&1 || { echo >&2 "\033[31mi need git but it's not installed. aborting.\033[0m"; exit 1; }
mkdir -p /data/www/htdocs && cd /data/www/htdocs
git clone -b cola dreamix-git:cola && git clone -b HuaXi dreamix-git:tsb-server
git clone -b php7 dreamix-git:tsb-passport
git clone -b HuaXi-release dreamix-git:tsb-web
