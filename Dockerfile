FROM fedora:22
RUN dnf clean all && \
    dnf update -y && \
    dnf install -y http://rpms.famillecollet.com/fedora/remi-release-22.rpm  && \
    sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo && \
    dnf install -y http://dev.mysql.com/get/mysql-community-release-fc22-5.noarch.rpm && \
    dnf update -y && \
    dnf install -y iproute procps-ng htop mysql-community-server curl && \
    dnf clean all 
ADD ./init-mysql.sh /root/init-mysql.sh
ADD ./bashrc /root/.bashrc
ADD ./my.cnf /etc/my.cnf
RUN chmod a+x /root/init-mysql.sh
