#!/usr/bin/env bash
set -eEou pipefail

. settings.sh

VIDEO_DEVICE=/dev/video0
# Get the group number of the video group, docker groups may differ
VIDEO_GROUP=`stat -c "%g" $VIDEO_DEVICE`

# Test whether a running container exists
CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=running --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`
if [[ -n $CONTAINER_NAME ]]; then
    echo "Container already running, connect with ./connect or stop it with ./stop"
    exit 1
fi

# Test whether a stopped container exists
CONTAINER_NAME=`$DOCKER_COMMAND ps --filter status=exited --filter ancestor=$IMAGE_NAME --format "{{.Names}}"`
if [[ -n $CONTAINER_NAME ]]; then
    echo "Resuming stopped container"
    $DOCKER_COMMAND start $CONTAINER_NAME > /dev/null
else
    # Run the container with shared X11
    $DOCKER_COMMAND run -d \
      --net=host \
      --add-host=$HOSTNAME:127.0.1.1 \
      -e SHELL \
      -e DISPLAY \
      -e DOCKER=1 \
      -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      --device=$VIDEO_DEVICE:/dev/video0 \
      --group-add=$VIDEO_GROUP \
      --cap-add=SYS_PTRACE \
      --security-opt seccomp=unconfined \
      --name "rosdocked_rolling_projekt_2022" \
      -it $IMAGE_NAME > /dev/null  # Do not print container id
fi
