FROM centos:6.6

MAINTAINER oblank <dyh1919@gmail.com>

# redis
RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install redis; yum clean all
RUN mkdir -p /data/db

EXPOSE 6379

CMD [ "redis-server" ]