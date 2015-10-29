#!/bin/sh

set -e 
if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi
DATADIR="/mysql-data"
if [ "$1" = 'mysqld' ]; then 
    if [ ! -d $DATADIR/mysql ]; then
        echo 'Initializing database'
        mysqld --initialize-insecure=on --user=mysql --datadir="$DATADIR"
        echo 'Database initialized'
        mysqld --user=mysql --datadir="$DATADIR" &
        sleep 15
        echo "use mysql;delete from mysql.user where User = ''; update user set Host='%' where User='root' and Host='localhost';flush privileges;" | mysql -u root -h 127.0.0.1
    fi
fi
chown -R mysql:mysql "$DATADIR"
chmod -R a+rx /mysql-data
exec "$@"
