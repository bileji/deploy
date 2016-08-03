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
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

RUN yum install -y php70w php70w-opcache
RUN yum install -y php70w-fpm php70w-mbstring php70w-gd php70w-dom php70w-xml php70w-pdo php70w-mysqlnd php70w-mcrypt php70w-process php70w-pear php70w-cli php70w-devel

CMD ["/sbin/init"]
#CMD ["php-fpm", "-F"]
