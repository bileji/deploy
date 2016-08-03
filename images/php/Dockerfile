FROM centos:6

MAINTAINER shuchao <shuc324@gmail.com>

#shadowsocks
RUN yum install -y python-setuptool && easy_install pip
RUN pip install shadowsocks
RUN sslocal -s 47.90.1.235 -p 8388 -b 127.0.0.1 -l 1080 -k 5dae3cdc -m aes-256-cfb -t 600 -d start
#proxychains4
RUN yum install -y git
RUN cd ~ && git clone https://github.com/roflor/proxychains-ng.git
RUN cd proxychains-ng && ./configure
RUN make && make install
RUN cp ./src/proxychains.conf /etc/proxychains.conf
RUN cd .. && rm -rf proxychains-ng
RUN sed -E -i "s/^socks4\ 127\.0\.0\.1\ 9095/socks5\ 127\.0\.0\.1\ 1080/" /etc/proxychains.conf

#update
RUN proxychains4 yum update

#php7
RUN proxychains4 rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN proxychains4 rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

RUN proxychains4 yum install -y php70w php70w-opcache
RUN proxychains4 yum install -y php70w-fpm php70w-mbstring php70w-gd php70w-dom php70w-xml php70w-pdo php70w-mysqlnd php70w-mcrypt php70w-process php70w-pear php70w-cli php70w-devel

# todo
RUN pecl install redis && pecl install mongodb
RUN proxychains4 yum install -y openssl openssl-devel

#volume
RUN mkdir /var/www
RUN chown -R www-data:www-data /var/www

WORKDIR /var/www
EXPOSE 9000

CMD ["/usr/sbin/php-fpm", "-c /etc/php-fpm.conf"]
