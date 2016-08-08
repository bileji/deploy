FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN  yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install memcached; yum clean all

EXPOSE  11211

CMD  ["memcached", "-u", "daemon"]
