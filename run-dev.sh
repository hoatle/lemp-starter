#!/bin/bash

# you can install anything that you want for the dev php container
# see: "How to install more PHP extensions" from https://hub.docker.com/r/library/php/

docker-php-ext-install mysqli

php-fpm
