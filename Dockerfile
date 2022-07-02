FROM ubuntu:xenial
LABEL maintainer="ikambarov@yahoo.com"
RUN apt-get update -y && apt-get install apache2 git -y && rm -rf /var/www/html/*
RUN git clone -b master https://github.com/ikambarov/melodi.git /var/www/html/
WORKDIR /var/www/html/
EXPOSE 80 443
CMD ["/usr/sbin/apache2ctl",  "-D",  "FOREGROUND"]

