#!/bin/sh
mysql_install_db --user=mysql --datadir=/mysql-data
mysqld_safe &
sleep 15
echo "use mysql;delete from mysql.user where User = ''; update user set Host='%' where User='root' and Host='localhost';flush privileges;" | mysql -u root -h 127.0.0.1
echo "Ok, MySQL now up and running"
