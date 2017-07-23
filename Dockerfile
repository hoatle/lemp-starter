FROM php:7.0.21-fpm-alpine

LABEL authors="hoatle <hoatle@teracy.com>"

RUN mkdir -p /opt/app

ENV TERM=xterm APP=/opt/app

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME


ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME

WORKDIR $APP

RUN docker-php-ext-install mysqli

ADD run-prod.sh $APP/

ADD html /usr/share/nginx/html/

CMD ["sh", "run-prod.sh"]
