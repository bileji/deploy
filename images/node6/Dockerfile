FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum install -y nodejs python-setuptools

RUN npm install -g grunt pm2
RUN mkdir -p /data/www && chmod -R 777 /data/www

RUN easy_install supervisor && echo_supervisord_conf > /etc/supervisord.conf

EXPOSE 8010

#CMD ["/usr/bin/supervisord -c /etc/supervisord.conf"]
CMD ["/bin/bash"]