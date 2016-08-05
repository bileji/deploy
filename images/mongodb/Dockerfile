FROM centos:6.6

MAINTAINER oblank <dyh1919@gmail.com>

# Install MongoDB
RUN echo -e "[mongodb]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/redhat/6/mongodb-org/3.2/`uname -m`/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/mongodb.repo
RUN yum install -y mongodb-org
RUN mkdir -p /data/db

ADD mongod.conf /etc/mongod.conf

#remove auth schema
#use admin
#db.system.users.remove({});
#db.system.version.remove({});
#db.system.version.insert({ "_id" : "authSchema", "currentVersion" : 3 });



EXPOSE 27017
ENTRYPOINT ["/usr/bin/mongod -f /etc/mongod.conf"]