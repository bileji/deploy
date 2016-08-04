FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum update -y
RUN yum install -y memcached

EXPOSE 11211

CMD ["memcached", "-u", "daemon"]
