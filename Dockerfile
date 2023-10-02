FROM ubuntu:latest

# Update package list
RUN apt update

# Install required packages
RUN apt-get install -y apache2 zip unzip 

# Download and extract the HTML template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip healet.zip
RUN mv healet-html/* .
RUN rm -rf healet-html healet.zip

# Start Apache in the foreground
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
