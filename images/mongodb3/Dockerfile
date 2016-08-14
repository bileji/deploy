FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN { \
    echo "[mongodb-org-3.0]"; \
    echo "name=MongoDB Repository"; \
    echo "baseurl=https://repo.mongodb.org/yum/redhat/\$releasever/mongodb-org/3.0/x86_64/"; \
    echo "gpgcheck=0"; \
    echo "enabled=1"; \
} > /etc/yum.repos.d/mongodb-org-3.0.repo

RUN yum install -y mongodb-org
RUN mkdir -p /data/db/mongodb /data/logs/mongodb && chmod 777 -R /data/db /data/logs

ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh

EXPOSE 27017

CMD ["/run.sh"]
