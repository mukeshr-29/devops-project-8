FROM ubuntu:latest

# Install Apache and other dependencies
RUN apt-get update && \
    apt-get install -y apache2 \
                       zip \
                       unzip

# Download and extract the website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip && \
    mv healet-html/* . && \
    rm -rf healet-html healet.zip

# Set Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid

# Start Apache in the foreground
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
