# Dockerfile-app

# Use PHP 7.1 with Apache for the base image
FROM php:7.1-apache

# Enable the Rewrite Apache mod
RUN cd /etc/apache2/mods-enabled && \
    ln -s ../mods-available/rewrite.load

# Install required PHP extensions
# -- GD
RUN apt update && \
    apt install -y libfreetype6-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd
# -- Intl
RUN apt install -y libicu-dev && \
    docker-php-ext-install -j$(nproc) intl
# -- postgres
RUN apt install -y libpq-dev && \
    docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install -j$(nproc) pgsql pdo pdo_pgsql
# -- mysql
RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql
# -- mongodb
RUN apt install -y libcurl4-openssl-dev pkg-config libssl-dev && \
	pecl install mongodb && \
    docker-php-ext-enable mongodb
# -- ziparchive
RUN docker-php-ext-install -j$(nproc) zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install git and unzip
RUN apt install git unzip -y

# Copy HTTP server config
COPY ./docker/000-default.conf /etc/apache2/sites-available/