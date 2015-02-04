FROM fedora:21
RUN yum clean all
RUN yum update -y
RUN yum install -y http://rpms.famillecollet.com/fedora/remi-release-21.rpm
RUN sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/remi.repo
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-fc21-5.noarch.rpm
RUN yum update -y
RUN yum install -y mysql-community-server
RUN yum install -y curl
RUN yum clean all
ADD ./init-mysql.sh /root/init-mysql.sh
ADD ./bashrc /root/.bashrc
ADD ./my.cnf /etc/my.cnf
RUN chmod a+x /root/init-mysql.sh
