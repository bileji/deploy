FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum update -y

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN yum --enablerepo=remi,remi-test install -y redis

RUN sed -E -i "s/^timeout 0/timeout 300/" /etc/redis.conf
RUN sed -E -i "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis.conf
RUN sed -E -i "s/^dir \/var\/lib\/redis\//dir \/data\/db\/redis\//" /etc/redis.conf
RUN sed -E -i "s/^logfile \/var\/log\/redis\/redis.log/logfile \/data\/logs\/redis\/redis.log/" /etc/redis.conf
RUN sed -E -i "s/^protected-mode\ .+?$/protected-mode\ no/" /etc/redis.conf
RUN sed -E -i "s/^# rename-command CONFIG \"\"/rename-command CONFIG \"GIFNOC\"/" /etc/redis.conf
RUN sed -E -i "/^rename-command CONFIG \"GIFNOC\"/a\rename-command FLUSHALL \"LLAHSULF\"" /etc/redis.conf
RUN sed -E -i "/^rename-command CONFIG \"GIFNOC\"/a\rename-command EVAL \"EVAL\"" /etc/redis.conf

RUN mkdir -p /data/db/redis /data/logs/redis && chown redis:redis /data/db/redis /data/logs/redis && chmod 777 -R /data/db /data/logs

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]
