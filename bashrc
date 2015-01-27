#!/bin/sh

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
/usr/bin/mysqld_safe &
