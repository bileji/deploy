FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

#update
# RUN yum -y update

#php7
RUN mkdir -p /data/logs && chmod 777 -R /data

RUN {\
    echo "[mysql57-community]"; \
    echo "name=MySQL 5.7 Community Server"; \
    echo "baseurl=http://repo.mysql.com/yum/mysql-5.7-community/el/6/\$basearch/"; \
    echo "enabled=1"; \
    echo "gpgcheck=1"; \
    echo "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql"; \
} > /etc/yum.repos.d/mysql-communtity.repo

RUN yum install -y mysql-community-server

# RUN sed -Ei 's/^(bind-address)/#&/' /etc/my.cnf
# RUN { \
#     echo '[mysqld]'; \
#     echo 'console=1'; \
#     echo 'general_log=1'; \
#     echo 'general_log_file=/dev/stdout'; \
#     echo 'log_error=/dev/stderr'; \
# } > /etc/mysql/conf.d/my.cnf
# 
# ADD run.sh /usr/local/bin/run.sh
# RUN chmod +x /usr/local/bin/run.sh
# 
# VOLUME /var/lib/mysql
# 
# EXPOSE 3306
# 
# CMD ["/usr/local/bin/run.sh"]}
CMD ["/sbin/init"]
