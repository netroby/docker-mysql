#!/bin/sh

set -e 
if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi
if [ "$1" = 'mysqld' ]; then 
    DATADIR="/mysql-data"
    if [ ! -d $DATADIR/mysql ]; then
        echo 'Initializing database'
        mysqld --initialize-insecure=on --user=mysql --datadir="$DATADIR"
        echo 'Database initialized'
        mysqld --user=mysql --datadir="$DATADIR" &
        sleep 15
        echo "use mysql;delete from mysql.user where User = ''; update user set Host='%' where User='root' and Host='localhost';flush privileges;" | mysql -u root -h 127.0.0.1
        chown -R mysql:mysql "$DATADIR"

        /root/init-mysql.sh
    else
        chown -R mysql:mysql /mysql-data
        chmod -R a+rx /mysql-data
    fi
fi

exec "$@"
