ARG PHP_VERSION
FROM ${PHP_VERSION}

# Update packages
RUN apt-get update

# Install PHP and composer dependencies
RUN apt-get install -qq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev

# Clear out the local repository of retrieved package files
# RUN apt-get clean

# 安装php扩展
# Install needed extensions
# Here you can install any other extension that you need during the test and deployment process
# RUN apt-get clean; docker-php-ext-install pdo pdo_mysql xsl zip gd pcntl opcache bcmath

ADD ./install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions  \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    intl \
    ldap \
    memcached \
    mysqli \
    opcache \
    pdo_mysql \
    pdo_pgsql \
    pgsql \
    redis \
    soap \
    xsl \
    zip \
    sockets\
    swoole\
    yaf\
    memcached\
    mongodb\
    mcrypt

# Installs Composer to easily manage your PHP dependencies.
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD php-fpm