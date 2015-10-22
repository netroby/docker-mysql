#!/bin/sh
DATADIR="/mysql-data"
echo 'Initializing database'
mysqld --initialize-insecure=on --user=mysql --datadir="$DATADIR"
echo 'Database initialized'
mysqld --user=mysql --datadir="$DATADIR" &
sleep 15
echo "use mysql;delete from mysql.user where User = ''; update user set Host='%' where User='root' and Host='localhost';flush privileges;" | mysql -u root -h 127.0.0.1
echo "Ok, MySQL now up and running"
