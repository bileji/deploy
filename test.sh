#!/bin/bash
PWD=cat docker-db.yml|grep MONGODB_USER|awk -F ":" '{print $2}'
#echo ${PWD//\"}
echo ${PWD}
