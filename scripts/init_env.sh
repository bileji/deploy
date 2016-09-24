#!/bin/bash
MOUNT="./volumes/"
DB_DIRS=("mysql" "redis" "mongodb")
LOG_DIRS=("mysql" "redis" "mongodb" "nginx" "php")
for DIR in ${DB_DIRS[*]}
do
	DB_PATH_NAME="${MOUNT/%\//}/db/${DIR}"
	rm -rf ${DB_PATH_NAME} && mkdir -p ${DB_PATH_NAME} && chmod -R 777 ${DB_PATH_NAME}
done

for DIR in ${LOG_DIRS[*]}
do
	LOG_PATH_NAME="${MOUNT/%\//}/logs/${DIR}"
	rm -rf ${LOG_PATH_NAME} && mkdir -p ${LOG_PATH_NAME} && chmod -R 777 ${LOG_PATH_NAME}
done
