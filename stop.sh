#!/usr/bin/env bash

. settings.sh

CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=running --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`

if [[ -z $CONTAINER_NAME ]]; then
    echo "The container is not running"
else
    $DOCKER_COMMAND stop $CONTAINER_NAME > /dev/null  # Do not print container name
fi
