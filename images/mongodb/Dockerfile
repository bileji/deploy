FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

# Install MongoDB
RUN echo -e "[mongodb]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/`uname -m`/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/mongodb.repo
RUN yum install -y mongodb-org
RUN mkdir -p /data/db

ADD mongod.conf /etc/mongod.conf

EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod"]