FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

#proxychains4
#RUN yum install -y git gcc
#RUN cd ~ && git clone https://github.com/rofl0r/proxychains-ng.git
#RUN cd ~/proxychains-ng && ./configure && make && make install
#RUN cp ~/proxychains-ng/src/proxychains.conf /etc/proxychains.conf
#RUN sed -E -i "s/^socks4.*127\.0\.0\.1 9050/socks5\ `cat /etc/hosts|grep proxy|awk '{print $1}'` 1080/" /etc/proxychains.conf
#RUN rm -rf ~/proxychains-ng

#update
#RUN yum -y update

#php7
RUN mkdir -p /data/logs && chmod 777 -R /data

#编译安装
# RUN yum install -y libxml2 libxml2-devel openssl openssl-devel curl-devel libjpeg-devel libpng-devel freetype-devel libmcrypt-devel
# ADD ./php-7.0.9.tar.gz /root/php-7.0.9.tar.gz
# RUN yum install -y tar && tar -zxvf /root/php-7.0.9.tar.gz
# RUN cd /root/php-7.0.9 && ./configure --prefix=/usr/local/php --exec-prefix=/usr/local/php --bindir=/usr/local/php/bin --sbindir=/usr/local/php/sbin --includedir=/usr/local/php/include --libdir=/usr/local/php/lib/php --mandir=/usr/local/php/php/man --with-config-file-path=/usr/local/php/etc --with-mysql-sock=/var/run/mysql/mysql.sock --with-mcrypt=/usr/include --with-mhash --with-openssl --with-mysql=shared,mysqlnd --with-mysqli=shared,mysqlnd --with-pdo-mysql=shared,mysqlnd --with-gd --with-iconv --with-zlib --enable-zip --enable-inline-optimization --disable-debug --disable-rpath --enable-shared --enable-xml --enable-bcmath --enable-shmop --enable-sysvsem --enable-mbregex --enable-mbstring --enable-ftp --enable-gd-native-ttf --enable-pcntl --enable-sockets --with-xmlrpc --enable-soap --without-pear --with-gettext --enable-session --with-curl --with-jpeg-dir --with-freetype-dir --enable-opcache --enable-fpm --enable-fastcgi --with-fpm-user=nginx --with-fpm-group=nginx --without-gdbm --disable-fileinfo

#直接安装
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum install -y php70w

RUN yum install -y php70w-fpm php70w-mbstring php70w-gd php70w-dom php70w-xml php70w-pdo php70w-mysqlnd php70w-mcrypt php70w-process php70w-pear php70w-cli php70w-devel php70w-opcache
RUN sed -E -i "s/^error_log = \/var\/log\/php-fpm\/error.log/error_log = \/data\/logs\/php-fpm.log/" /etc/php-fpm.conf
RUN sed -E -i "s/^listen =.+?$/listen = 0.0.0.0:9000/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^listen.allowed_clients =.+?$/listen.allowed_clients = 0.0.0.0:9000/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^slowlog = \/var\/log\/php-fpm\/www-slow.log/slowlog = \/data\/logs\/www_slow.log/" /etc/php-fpm.d/www.conf 
RUN sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php.ini
RUN sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php.ini
RUN sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php.ini
RUN sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT \& \~E_NOTICE/" /etc/php.ini
 
ADD ./ext/*.ini /etc/php.d/
ADD ./ext/*.so /usr/lib64/php/modules/

#挂载相关
RUN groupadd www-data && useradd -g www-data www-data
RUN mkdir /data/www && chmod 777 -R /data/www && chown -R www-data:www-data /data/www

EXPOSE 9000

CMD ["php-fpm", "-F"]
