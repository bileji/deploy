FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum install -y nodejs

RUN npm install -g grunt pm2
RUN mkdir -p /data/www && chmod -R 777 /data/www

EXPOSE 8010

CMD ["/bin/bash"]