FROM ubuntu:latest
RUN apt update
RUN apt-get install -y apache2 \
zip \
unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip
RUN mv healet-html/* .
RUN rm -rf healet-html healet.zip

# Create a custom Apache configuration file
RUN echo "Define APACHE_RUN_DIR /var/run/apache2" >> /etc/apache2/apache2.conf
RUN echo "Define APACHE_RUN_USER www-data" >> /etc/apache2/apache2.conf
RUN echo "Define APACHE_RUN_GROUP www-data" >> /etc/apache2/apache2.conf

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80
