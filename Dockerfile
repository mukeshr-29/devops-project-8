FROM ubuntu:latest
RUN apt update
RUN apt-get install -y apache2 \
zip \
unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip
RUN cp -rvf healet-html/* .
RUN rm -rf healet-html healet.zip
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80