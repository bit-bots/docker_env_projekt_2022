#!/usr/bin/env bash
set -eEou pipefail

. settings.sh

DIRNAME=`dirname $0`

# Build the docker image
$DOCKER_COMMAND build \
  --pull \
  --network=host
  -t $IMAGE_NAME $DIRNAME \
  $@
