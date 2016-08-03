FROM centos:6.6

MAINTAINER shuchao <shuc324@gmail.com>

#shadowsocks
RUN yum install -y python-setuptools && easy_install pip
RUN pip install shadowsocks
RUN {\
    echo '{'; \
    echo '  "server": "47.90.1.235",'; \
    echo '  "server_port": 8388,'; \
    echo '  "local_address": "0.0.0.0",'; \
    echo '  "local_port": 1080,'; \
    echo '  "password": "5dae3cdc",'; \
    echo '  "timeout": 600,'; \
    echo '  "method": "aes-256-cfb"'; \
    echo '}'; \
} > /etc/shadowsocks.json

EXPOSE 1080

CMD ["sslocal", "-c", "/etc/shadowsocks.json", "start", "-d"]
