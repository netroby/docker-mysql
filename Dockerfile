FROM fedora:22
RUN dnf clean all
RUN dnf update -y
RUN dnf install -y http://rpms.famillecollet.com/fedora/remi-release-22.rpm
RUN sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo
RUN dnf install -y http://dev.mysql.com/get/mysql-community-release-fc22-5.noarch.rpm
RUN dnf update -y
RUN dnf install -y procps-ng htop mysql-community-server curl
RUN dnf clean all
ADD ./init-mysql.sh /root/init-mysql.sh
ADD ./bashrc /root/.bashrc
ADD ./my.cnf /etc/my.cnf
RUN chmod a+x /root/init-mysql.sh
