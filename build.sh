#!/usr/bin/env bash
set -eEou pipefail

#DOCKER_COMMAND="podman --root=/export/scratch/podman --storage-opt mount_program=/usr/bin/fuse-overlayfs"
DOCKER_COMMAND="docker"
IMAGE_NAME=registry.bit-bots.de/ros-rolling-bitbots-projekt

DIRNAME=`dirname $0`

# Build the docker image
$DOCKER_COMMAND build \
  --pull \
  --network=host \
  --build-arg user=$USER \
  --build-arg uid=$UID \
  --build-arg home=$HOME \
  --build-arg workspace=$HOME \
  --build-arg shell=$SHELL \
  -t $IMAGE_NAME $DIRNAME \
  $@
