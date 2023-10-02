FROM ubuntu:latest

RUN apt update \
    && apt install -y apache2 zip unzip \
    && rm -rf /var/lib/apt/lists/*

# Download the template zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /tmp/healet.zip

# Move to the HTML directory
WORKDIR /var/www/html/

# Extract the template
RUN unzip /tmp/healet.zip -d /var/www/html/ \
    && mv /var/www/html/healet/* /var/www/html/ \
    && rm -rf /var/www/html/healet /tmp/healet.zip

# Start Apache
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

EXPOSE 80
