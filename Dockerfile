FROM php:7-fpm

# system update
RUN apt-get -y update && apt-get -y upgrade

# locale
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)
ENV TZ JST-9

# etc
ENV TERM xterm

# tools
RUN apt-get install -y less vim git zip unzip git libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev

# php options
WORKDIR /var/www/
RUN docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt
RUN rm -rf /var/www/html/

# composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# user setting
RUN usermod -u 1000 www-data \
    && groupmod -g 1000 www-data
