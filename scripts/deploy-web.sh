#!/bin/bash

echo "\033[31mPlease make sure php service extra_hosts is filled correctly.\033[0m";

MOUNT="/data/"
LOG_DIRS=("nginx" "php")

for DIR in ${LOG_DIRS[*]}
do
	LOG_PATH_NAME="${MOUNT/%\//}/logs/${DIR}"
	rm -rf ${LOG_PATH_NAME} && mkdir -p ${LOG_PATH_NAME} && chmod -R 777 ${LOG_PATH_NAME}
done

echo "\033[32minit dir done!\033[0m";
