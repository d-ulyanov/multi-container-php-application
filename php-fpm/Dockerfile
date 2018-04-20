FROM php:7.1-fpm

MAINTAINER Dmitry Ulyanov <swhile@ya.ru>

COPY php.ini /usr/local/etc/php/
COPY www/* /var/www/

RUN pecl install redis-3.1.6 \
    && docker-php-ext-enable redis
