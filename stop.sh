#!/usr/bin/env bash

#DOCKER_COMMAND="podman --root=/export/scratch/podman --storage-opt mount_program=/usr/bin/fuse-overlayfs"
DOCKER_COMMAND="docker"

IMAGE_NAME=registry.bit-bots.de/ros-rolling-bitbots-projekt
CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=running --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`

if [[ -z $CONTAINER_NAME ]]; then
    echo "The container is not running"
else
    $DOCKER_COMMAND stop $CONTAINER_NAME > /dev/null  # Do not print container name
fi
