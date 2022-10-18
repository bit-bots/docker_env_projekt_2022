#!/usr/bin/env bash
set -eEou pipefail

. settings.sh

CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=running --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`

if [[ -z $CONTAINER_NAME ]]; then
    echo "Container not running, starting it"
    DIR=`dirname $0`
    bash -c "$DIR/start.sh"
fi

CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=running --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`

if [[ -z $@ ]]; then
	$DOCKER_COMMAND exec -it $CONTAINER_NAME $SHELL
else
	$DOCKER_COMMAND exec -it $CONTAINER_NAME "$@"
fi
