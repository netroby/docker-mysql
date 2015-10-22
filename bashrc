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
