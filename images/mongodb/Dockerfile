FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

# mongodb 2.6
RUN { \
	echo "[mongodb]"; \
	echo "name=MongoDB Repository"; \
	echo "baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/"; \
	echo "gpgcheck=0"; \
	echo "enabled=1"; \
} > /etc/yum.repos.d/mongodb-org.repo

RUN yum install -y mongodb-org
RUN mkdir -p /data /data/db && chmod 777 -R /data/db

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

EXPOSE 27017

CMD ["/run.sh"]
