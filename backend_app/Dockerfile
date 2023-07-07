FROM php:8.0.2-fpm-alpine

RUN apk add --no-cache libzip-dev \
    && docker-php-ext-install zip \
    && apk add --no-cache freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql
