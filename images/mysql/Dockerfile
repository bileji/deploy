FROM centos:centos6

MAINTAINER Hayashi Seion

RUN groupadd -r mysql && useradd -r -g mysql mysql

# installs from mysql public repo
RUN yum -y install wget libstdc++*
RUN wget http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm -d && \
    yum localinstall mysql-community-release-el6-5.noarch.rpm -y && \
    yum install mysql-community-server -y && \
    rm mysql-community-release-el6-5.noarch.rpm && \
    yum clean all

VOLUME /var/lib/mysql

ADD my.cnf /etc/my.cnf
ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
RUN chown mysql:mysql /var/lib/mysql

EXPOSE 3306
CMD ["/entrypoint.sh","mysqld", "--datadir=/var/lib/mysql", "--user=mysql"]