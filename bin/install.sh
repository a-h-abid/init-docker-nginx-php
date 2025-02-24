#!/usr/bin/env bash

CLONE_URL=https://github.com/a-h-abid/init-docker-nginx-php.git
TEMP_DIR_NAME=ahabid-init-docker-nginx-php-$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 6)

git clone $CLONE_URL /tmp/$TEMP_DIR_NAME
sh /tmp/$TEMP_DIR_NAME/bin/init-docker-nginx-php

rm -rf /tmp/$TEMP_DIR_NAME
