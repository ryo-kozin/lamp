FROM php:7.4.16-apache

RUN apt-get update \
    && apt-get install -y \
    git \
    zip \
    unzip \
    vim \
    zlib1g-dev \
    libpng-dev \
    && docker-php-ext-install pdo_mysql mysqli

RUN cd /etc/apache2/mods-enabled \
    && ln -s ../mods-available/rewrite.load

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin


