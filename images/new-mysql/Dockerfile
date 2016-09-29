FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum update -y && rpm -Uvh http://repo.mysql.com//mysql57-community-release-el6-9.noarch.rpm
RUN yum install mysql-community-server -y

EXPOSE 3306

CMD ["/usr/sbin/run_init"]
