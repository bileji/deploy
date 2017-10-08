FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum install -y php70w libmemcached10
RUN yum install -y php70w-fpm php70w-mbstring php70w-gd php70w-dom php70w-xml php70w-pdo php70w-mysqlnd php70w-mcrypt php70w-process php70w-pear php70w-cli php70w-devel php70w-opcache php70w-soap
RUN yum update -y php
RUN sed -E -i "s/^error_log = \/var\/log\/php-fpm\/error.log/error_log = \/data\/logs\/php\/fpm-error.log/" /etc/php-fpm.conf
RUN sed -E -i "s/^listen =.+?$/listen = 0.0.0.0:9000/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^listen.allowed_clients =.+?$/; listen.allowed_clients = 127\.0\.0\.1/" /etc/php-fpm.d/www.conf
RUN sed -E -i "s/^slowlog = \/var\/log\/php-fpm\/www-slow.log/slowlog = \/data\/logs\/php\/php-slow.log/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^php_admin_value\[error_log\] =.+?$/php_admin_value\[error_log\] = \/data\/logs\/php\/php-error.log/" /etc/php-fpm.d/www.conf 
RUN { \
    echo "catch_workers_output = yes"; \
} >> /etc/php-fpm.d/www.conf
RUN sed -E -i "s/^post_max_size =.+?$/post_max_size = 100M/" /etc/php.ini
RUN sed -E -i "s/^upload_max_filesize =.+?$/upload_max_filesize = 100M/" /etc/php.ini
RUN sed -E -i "s/^display_errors .+?$/display_errors = On/" /etc/php.ini
RUN sed -E -i "s/^error_reporting .+?$/error_reporting = E_ALL\ \&\ \~E_DEPRECATED\ \&\ \~E_STRICT\ \&\ \~E_NOTICE/" /etc/php.ini
RUN sed -E -i "s/^;error_log = php_errors.log/error_log = \/data\/logs\/php\/cli_error.log/" /etc/php.ini

RUN mkdir -p /data/www && chmod 777 -R /data/www
RUN mkdir -p /data/logs/php && chmod 777 -R /data/logs
 
ADD ./ext/*.ini /etc/php.d/
ADD ./ext/*.so /usr/lib64/php/modules/

#crontab
RUN yum install -y vixie-cron
RUN chkconfig crond on
RUN sed -E -i "s/account    required   pam_loginuid.so/account    optional   pam_loginuid.so/" /etc/pam.d/crond 

EXPOSE 9000

CMD ["php-fpm", "-F"]
