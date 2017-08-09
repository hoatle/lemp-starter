#!/bin/bash

# you can install anything that you want for the dev php container
# see: "How to install more PHP extensions" from https://hub.docker.com/r/library/php/

#apk update \
#    && apk add --no-cache g++ make autoconf
#
#docker-php-source extract
#
#pecl install xdebug
#
#echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#
#docker-php-source delete

#docker-php-ext-install mysqli

#curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
#    && rm -rf /tmp/*

# nginx dynamically listen to defined $PORT
# if no $PORT specified, listen on port 80

if [ -z "$PORT" ]; then
  export PORT=80;
fi

echo "nginx listening on the port: $PORT";

envsubst '${PORT}' <nginx/sites-available/default.tpl.conf >/etc/nginx/sites-available/default.conf

sh /start.sh
