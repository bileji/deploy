FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

#update
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm 

#php5
RUN yum install -y libmcrypt php56w php56w-fpm php56w-mbstring php56w-gd php56w-dom php56w-pdo php56w-mysqlnd php56w-mcrypt php56w-process php56w-pear php56w-cli php56w-xml php56w-curl php56w-pecl-memcached php56w-devel php56w-pecl-redis

RUN sed -E -i "s/^error_log\ = \/var\/log\/php-fpm\/error.log/error_log = \/data\/logs\/php-fpm\/error.log/" /etc/php-fpm.conf
RUN sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^slowlog\ = \/var\/log\/php-fpm\/www-slow.log/slowlog = \/data\/logs\/php\/slow.log/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^php_admin_value\[error_log\]\ =.+?$/php_admin_value\[error_log\]\ =\ \/data\/logs\/php\/error.log/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php.ini
RUN sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php.ini
RUN sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php.ini
RUN sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT \& \~E_NOTICE/" /etc/php.ini
 
RUN mkdir -p /data/www && chmod 777 -R /data/www
RUN mkdir -p /data/logs /data/logs/php-fpm /data/logs/php && chmod 777 -R /data

EXPOSE 9000

CMD ["php-fpm", "-F"]
