FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum install epel-release -y && yum update -y && rpm -Uvh http://repo.mysql.com//mysql57-community-release-el6-9.noarch.rpm
RUN yum install mysql-community-server perl pwgen ca-certificates -y

# install gosu to easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64"
RUN curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc"
RUN gpg --verify /usr/local/bin/gosu.asc
RUN rm -rf /usr/local/bin/gosu.asc /root/.gnupg/
RUN chmod a+x /usr/local/bin/gosu
RUN gosu nobody true

RUN mkdir -p /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN chown -R mysql:mysql /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld /var/lib/mysql

RUN sed -Ei "s/^(bind-address)/#&/" /etc/my.cnf
RUN sed -Ei "s/^datadir.+?/datadir=\/data\/db\/mysql/" /etc/my.cnf
RUN sed -Ei "s/^log-error.+?/log-error=\/data\/logs\/mysql\/mysqld.log/" /etc/my.cnf
RUN sed -Ei "/^log-error/a\slow-query-log=true" /etc/my.cnf
RUN sed -Ei "/^slow-query-log/a\long-query-time=1" /etc/my.cnf
RUN sed -Ei "/^long-query-time/a\slow-query-log-file=\/data\/logs\/mysql\/slow_query.log" /etc/my.cnf

COPY entrypoint.sh /usr/local/bin/
COPY init_db.sql /entrypoint-initdb.d/
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld", "-u", "mysql"]
