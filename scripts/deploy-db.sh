#!/bin/bash

# deploy 根目录
DEPLOY_ROOT="/data/deploy"

MOUNT="/data/"
DB_DIRS=("mysql" "redis" "mongodb")
LOG_DIRS=("mysql" "redis" "mongodb")
for DIR in "${DB_DIRS[@]}"
do
	DB_PATH_NAME="${MOUNT/%\//}/db/${DIR}"
	rm -rf ${DB_PATH_NAME} && mkdir -p ${DB_PATH_NAME} && chmod -R 777 ${DB_PATH_NAME}
done

for DIR in "${LOG_DIRS[@]}"
do
	LOG_PATH_NAME="${MOUNT/%\//}/logs/${DIR}"
	rm -rf ${LOG_PATH_NAME} && mkdir -p ${LOG_PATH_NAME} && chmod -R 777 ${LOG_PATH_NAME}
done

docker-compose -f ${DEPLOY_ROOT/%\//}/docker-db.yml -p db up -d