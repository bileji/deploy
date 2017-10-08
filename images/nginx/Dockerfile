FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

RUN rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
RUN yum install -y nginx && yum update -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir -p /data/www /etc/nginx/includes && chown -R nginx:nginx /data/www
RUN sed -E -i '/include \/etc\/nginx\/conf\.d\/\*\.conf/ a\    include\ \/etc\/nginx\/sites-enabled\/*\.conf;' /etc/nginx/nginx.conf
RUN sed -E -i 's/worker_processes  1;/worker_processes  4;/' /etc/nginx/nginx.conf
RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.save

EXPOSE 80 443 8000

CMD ["nginx"]
