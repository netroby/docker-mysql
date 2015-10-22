FROM fedora:22
RUN dnf clean all && \
    dnf install -y http://dev.mysql.com/get/mysql57-community-release-fc22-7.noarch.rpm && \
    dnf update -y && \
    dnf install -y epel-release iproute procps-ng htop mysql-community-server curl && \
    dnf update -y && \
    dnf clean all 
ADD ./init-mysql.sh /root/init-mysql.sh
ADD ./bashrc /root/.bashrc
ADD ./my.cnf /etc/my.cnf
RUN chmod a+x /root/init-mysql.sh
