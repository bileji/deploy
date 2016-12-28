#!/bin/bash
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin

BASE_DIR="/data/db"

TIME=$(date +'%Y-%m-%d %H:%M:%S')
echo -e "To start backup database: \033[33m${TIME}\033[0m"
DATE=$(date +'%Y%m%d')
OLD_UNIX=$(date -d "$(date -d "-30 day" +'%Y-%m-%d %H:%M:%S')" +%s)

cd ${BASE_DIR} && echo -e "\033[32mEnter the directory:${BASE_DIR/%\//}\033[0m"

#-----------MYSQL
MYSQL_PREF="BACKUP_MYSQL_"
WORK_DIR="${BASE_DIR/%\//}/mysql/"

if [ ! -d "${WORK_DIR/%\//}" ]; then
    echo -e "\033[31mDirectory does not exist:${WORK_DIR/%\//}\033[0m"
fi

OLD_TAR=`ls -l ./ | grep ${MYSQL_PREF} | grep -v grep | awk '{print substr($9, 14, 8)}'`

echo -e "Began to clear the overdue mysql file..."

for TAR in "${OLD_TAR[@]}"
do
    UNIX=$(date -d "${TAR}" +%s)
    FILENAME="${MYSQL_PREF}${TAR}.tar.gz"
    if [ "${UNIX}" -lt "${OLD_UNIX}" ] &&  [ -f "./${FILENAME}" ]; then
        rm -rf "./${FILENAME}" && echo -e "     \033[31mdeleted:${FILENAME}\033[0m"
    fi
done

echo -e "To start backup mysql..."

tar czvf "${MYSQL_PREF}${DATE}.tar.gz" ./mysql > /dev/null 2>&1 && echo -e "The backup mysql successful"

#-----------MONGODB
MONGODB_PREF="BACKUP_MONGO_"
WORK_DIR="${BASE_DIR/%\//}/mongodb/"

if [ ! -d "${WORK_DIR/%\//}" ]; then
    echo -e "\033[31mDirectory does not exist:${WORK_DIR/%\//}\033[0m"
fi

OLD_TAR=`ls -l ./ | grep ${MONGODB_PREF} | grep -v grep | awk '{print substr($9, 14, 8)}'`

echo -e "Began to clear the overdue mongodb file..."

for TAR in "${OLD_TAR[@]}"
do
    UNIX=$(date -d "${TAR}" +%s)
    FILENAME="${MONGODB_PREF}${TAR}.tar.gz"
    if [ "${UNIX}" -lt "${OLD_UNIX}" ] &&  [ -f "./${FILENAME}" ]; then
        rm -rf "./${FILENAME}" && echo -e "     \033[31mdeleted:${FILENAME}\033[0m"
    fi
done

echo -e "To start backup mongodb..."

tar czvf "${MONGODB_PREF}${DATE}.tar.gz" ./mongodb > /dev/null 2>&1 && echo -e "The backup mongodb successful"

#-----------REDIS
REDIS_PREF="BACKUP_REDIS_"
WORK_DIR="${BASE_DIR/%\//}/redis/"

if [ ! -d "${WORK_DIR/%\//}" ]; then
    echo -e "\033[31mDirectory does not exist:${WORK_DIR/%\//}\033[0m"
fi

OLD_TAR=`ls -l ./ | grep ${REDIS_PREF} | grep -v grep | awk '{print substr($9, 14, 8)}'`

echo -e "Began to clear the overdue redis file..."

for TAR in "${OLD_TAR[@]}"
do
    UNIX=$(date -d "${TAR}" +%s)
    FILENAME="${REDIS_PREF}${TAR}.tar.gz"
    if [ "${UNIX}" -lt "${OLD_UNIX}" ] &&  [ -f "./${FILENAME}" ]; then
        rm -rf "./${FILENAME}" && echo -e "     \033[31mdeleted:${FILENAME}\033[0m"
    fi
done

echo -e "To start backup redis..."

tar czvf "${REDIS_PREF}${DATE}.tar.gz" ./redis > /dev/null 2>&1 && echo -e "The backup redis successful"

cd ~ && echo -e "\033[32mLeave the directory:${BASE_DIR/%\//}\033[0m"