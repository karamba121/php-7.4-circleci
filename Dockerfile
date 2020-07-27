FROM php:7.4-apache

RUN docker-php-ext-install mysql mysqli

RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install zip

RUN docker-php-ext-install gd

RUN pecl install grpc
docker-php-ext-enable grpc
