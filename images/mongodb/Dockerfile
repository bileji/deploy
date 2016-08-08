FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN { \
	echo "[mongodb]"; \
	echo "name=MongoDB Repository"; \
	echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"; \
	echo "gpgcheck=0"; \
	echo "enabled=1"; \
} > /etc/yum.repos.d/mongodb-org-3.0.repo

RUN yum install -y mongodb-org
RUN sed -E -i "s/\#port\=27017/port\=27017/" /etc/mongod.conf
RUN sed -E -i "s/bind_ip\=127\.0\.0\.1/bind_ip\=0\.0\.0\.0/" /etc/mongod.conf
RUN mkdir -p /data /data/db && chmod 777 -R /data/db

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

EXPOSE 27017

CMD ["/run.sh"]
