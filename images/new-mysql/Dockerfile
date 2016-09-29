FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN yum update -y && rpm -Uvh http://repo.mysql.com//mysql57-community-release-el6-9.noarch.rpm
RUN yum install mysql-community-server -y

RUN mkdir -p /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN chown -R mysql:mysql /data/db/mysql /data/logs/mysql /var/run/mysqld
RUN rm -rf /var/lib/mysql && chmod -R 777 /var/run/mysqld

RUN sed -Ei "s/^(bind-address|log)/#&/" /etc/my.cnf
RUN sed -Ei "s/^datadir.+?/datadir=\/data\/db\/mysql/" /etc/my.cnf
RUN sed -Ei "s/^log-error.+?/log-error=\/data\/logs\/mysql\/mysqld.log/" /etc/my.cnf

COPY entrypoint.sh /usr/local/bin/
COPY init_db.sql /entrypoint-initdb.d/
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
