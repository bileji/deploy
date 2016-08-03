#!/bin/bash
set -e

GENERATED_PASSWORD=`cat /var/log/mysqld.log |grep 'generated for root@localhost:'|awk -F 'generated for root@localhost: ' '{print $2}'''`

chown -R mysql:mysql /var/lib/mysql

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-""}
MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}

tfile="/usr/local/bin/mktemp"
if [[ ! -f "$tfile" ]]; then
    cat << EOF > $tfile
ALTER USER 'root'@'localhost' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD";
USE mysql;
FLUSH PRIVILEGES;
EOF
    
    #UPDATE user SET host="%" WHERE user='root';
    
    if [[ $MYSQL_DATABASE != "" ]]; then
        echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tfile
    
        if [[ $MYSQL_USER != "" ]]; then
            echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tfile
        fi
    fi
    
    mysql -u root -p$GENERATED_PASSWORD < $tfile
fi

exec service mysqld restart
