#!/bin/sh

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
#!/bin/sh

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ $(pidof mysqld) ]; then
        echo "mysqld already started"
else
    if [ ! -d /mysql-data/mysql ]; then
        /root/init-mysql.sh
    else
        chown -R mysql:mysql /mysql-data
        chmod -R a+rx /mysql-data
        mysqld --user=mysql --datadir=/mysql-data &
    fi
fi
#!/bin/sh
DATADIR="/mysql-data"
echo 'Initializing database'
mysqld --initialize-insecure=on --user=mysql --datadir="$DATADIR"
echo 'Database initialized'
mysqld --user=mysql --datadir="$DATADIR" &
sleep 15
echo "use mysql;delete from mysql.user where User = ''; update user set Host='%' where User='root' and Host='localhost';flush privileges;" | mysql -u root -h 127.0.0.1
chown -R mysql:mysql "$DATADIR"
echo "Ok, MySQL now up and running"
