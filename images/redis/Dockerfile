FROM centos:6.6

MAINTAINER oblank <dyh1919@gmail.com>

# redis
RUN yum install -y redis
RUN mkdir -p /data/db

EXPOSE 6379

CMD [ "redis-server" ]