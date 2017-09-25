
FROM ubuntu:16.04

ENV TERM xterm

RUN apt-get update && apt-get install -y software-properties-common php7.0 php7.0-fpm php7.0-xml php7.0-xsl php7.0-zip php7.0-gd php7.0-mbstring php7.0-mysql php7.0-sqlite php7.0-soap php-redis composer
RUN mkdir /run/php
RUN apt-get update && apt-get install -y libmagickwand-dev imagemagick php-imagick

COPY www.conf /etc/php/7.0/fpm/pool.d/www.conf
COPY php-fpm.conf /etc/php/7.0/fpm/php-fpm.conf
COPY overrides.conf /etc/php/7.0/fpm/pool.d/z-overrides.conf

EXPOSE 9000

CMD ["php-fpm7.0"]
