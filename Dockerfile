FROM ubuntu:xenial
LABEL maintainer="ikambarov@yahoo.com"
RUN apt-get update -y && apt-get install apache2 git -y && rm -rf /var/www/html/*
RUN git clone -b release-1.0 https://github.com/ikambarov/melodi.git /var/www/html/
WORKDIR /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl",  "-D",  "FOREGROUND"]

