FROM ubuntu:16.04

MAINTAINER Dmitry Ulyanov <swhile@ya.ru>

ENV PHP_UPSTREAM=php:9000

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-fastcgi

# Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN rm -f /etc/apache2/sites-enabled/*

COPY config/sites-available/* /etc/apache2/sites-available/
COPY config/conf-available/* /etc/apache2/conf-available/

RUN a2enmod rewrite proxy proxy_fcgi && \
    a2enconf server log php && \
    a2disconf other-vhosts-access-log

ADD docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
