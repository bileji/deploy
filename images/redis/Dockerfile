FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum update -y

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum --enablerepo=remi,remi-test install -y redis

RUN sed -Ei "s/^bind 127\.0\.0\.1/bind 0\.0\.0\.0/" /etc/redis.conf
RUN sed -Ei "s/^dir \/var\/lib\/redis\//dir \/data\/db\/redis\//" /etc/redis.conf
RUN sed -Ei "s/^# rename-command CONFIG \"\"/rename-command CONFIG \"GIFNOC\"/" /etc/redis.conf
RUN sed -Ei "/^rename-command CONFIG \"GIFNOC\"/a\rename-command FLUSHALL \"LLAHSULF\"" /etc/redis.conf
RUN sed -Ei "/^rename-command CONFIG \"GIFNOC\"/a\rename-command EVAL \"EVAL\"" /etc/redis.conf

RUN mkdir -p /data /data/db /data/db/redis && chown redis:redis /data/db/redis

EXPOSE 6379

CMD ["redis-server"]