FROM centos:latest
MAINTAINER mukeshr29@gmail.com

# Use a specific mirror for CentOS repositories
RUN sed -i 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/^#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/mirror.centos.org/mirrorlist.centos.org/g' /etc/yum.repos.d/CentOS-Base.repo

RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip
RUN cp -rvf healet/*
RUN rm -rf healet healet.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
