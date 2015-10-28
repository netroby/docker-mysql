FROM fedora:22
RUN dnf clean all && \
    dnf install -y http://dev.mysql.com/get/mysql57-community-release-fc22-7.noarch.rpm && \
    dnf update -y && \
    dnf install -y iproute procps-ng htop mysql-community-server curl && \
    dnf update -y && \
    dnf clean all 

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

COPY my.cnf /etc/my.cnf

ENV HOME /root

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3306

WORKDIR /root

CMD ["mysqld", "-u" , "mysql"]
