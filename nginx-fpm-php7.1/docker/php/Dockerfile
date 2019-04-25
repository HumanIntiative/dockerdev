FROM php:7.1-fpm
# Install modules
RUN apt update && apt install -y \
    curl \
    git \
    libpq-dev

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install -j$(nproc) bcmath mbstring pdo pdo_pgsql tokenizer

RUN apt install -y zlib1g-dev \
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Possible values for docker-php-ext-install:
# bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd 
# gettext gmp hash iconv imap interbase intl json ldap mbstring mcrypt mssql 
# mysql mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql 
# pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode 
# reflection session shmop simplexml snmp soap sockets spl standard sybase_ct sysvmsg 
# sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zip