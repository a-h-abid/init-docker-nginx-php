#!/usr/bin/env bash

DOWNLOAD_URL=https://github.com/a-h-abid/init-docker-nginx-php/archive/refs/heads/main.zip
TEMP_DIR_NAME=ahabid-init-docker-nginx-php-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6)

mkdir -p /tmp/$TEMP_DIR_NAME
curl -L -o /tmp/$TEMP_DIR_NAME/repo.zip $DOWNLOAD_URL
unzip /tmp/$TEMP_DIR_NAME/repo.zip -d /tmp/$TEMP_DIR_NAME
sh /tmp/$TEMP_DIR_NAME/init-docker-nginx-php-main/bin/init-docker-nginx-php

rm -rf /tmp/$TEMP_DIR_NAME
