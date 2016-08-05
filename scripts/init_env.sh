#!/bin/sh
rm -rf ./volumes/db/* && rm -rf ./volumes/logs/*
mkdir -p ./volumes/db/redis ./volumes/db/mysql ./volumes/db/mongodb
mkdir -p ./volumes/logs/php5/php ./volumes/logs/mysql ./volumes/logs/nginx ./volumes/logs/php7/php
chmod 777 -R ./volumes/db ./volumes/logs/*
