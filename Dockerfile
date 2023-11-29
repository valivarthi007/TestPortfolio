FROM alpine
LABEL MAINTAINER vdr007

# Setting the Working Directory
WORKDIR /var/www/html

# Install and Configure Apache
RUN apk update \
    && apk add --no-cache apache2 \
    && rm -rf /var/cache/apk/*

#Removing default page
RUN rm -rf /var/www/html/index.html


# Copying Files
COPY index.html /var/www/localhost/htdocs/
COPY style.css /var/www/localhost/htdocs/
COPY img/* /var/www/localhost/htdocs/img/

# Restart Apache2
RUN httpd -k restart

# Exposing Ports
EXPOSE 80

# Starting apache and serving the index

CMD ["httpd", "-D", "FOREGROUND"]
