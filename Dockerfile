FROM centos:latest
MAINTAINER mukeshr29@gmail.com
RUN yum install -y httpd \
zip\
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip
RUN cp -rvf healet/*
RUN rm -rf healet healet.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80