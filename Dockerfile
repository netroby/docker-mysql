FROM centos:7

ENV PACKAGE_URL https://repo.mysql.com/yum/mysql-5.7-community/docker/x86_64/mysql-community-server-minimal-5.7.12-1.el7.x86_64.rpm

RUN rpmkeys --import http://repo.mysql.com/RPM-GPG-KEY-mysql \
  && yum install -y $PACKAGE_URL \
  && rm -rf /var/cache/yum/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

VOLUME /var/lib/mysql

COPY my.cnf /etc/my.cnf

ENV HOME /root
ENV TERM xterm

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306

WORKDIR /root

CMD ["mysqld", "-u" , "mysql"]

