#!/bin/sh

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
if [ ! -d /mysql-data/mysql ]; then
    /root/init-mysql.sh
else
    /usr/bin/mysqld_safe &
fi
