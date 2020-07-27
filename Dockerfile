FROM php:7.4-fpm

RUN apt-get update -y && apt-get install -y libpng-dev zip

RUN docker-php-ext-install gd

RUN pecl install grpc

RUN mkdir -p /tmp/protoc && \
    curl -L https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip > /tmp/protoc/protoc.zip && \
    cd /tmp/protoc && \
    unzip protoc.zip && \
    cp /tmp/protoc/bin/protoc /usr/local/bin && \
    cd /tmp && \
    rm -r /tmp/protoc && \
    docker-php-ext-enable grpc

RUN php -r "echo extension_loaded('grpc') ? 'yes' : 'no';"
