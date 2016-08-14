#!/bin/bash
set -m

ENGINE=${STORAGE_ENGINE:-"wiredTiger"}

mongodb_cmd="mongod --storageEngine $ENGINE --directoryperdb"
cmd="$mongodb_cmd --httpinterface --rest --master --logpath /data/logs/mongodb/mongod.log --dbpath /data/db/mongodb"
if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

if [ "$JOURNALING" == "no" ]; then
    cmd="$cmd --nojournal"
fi

if [ "$OPLOG_SIZE" != "" ]; then
    cmd="$cmd --oplogSize $OPLOG_SIZE"
fi

$cmd &

if [ ! -f /data/db/.mongodb_password_set ]; then
    /set_mongodb_password.sh
fi

fg
