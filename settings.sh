DOCKER_COMMAND="podman --root=/export/scratch/podman --storage-opt mount_program=/usr/bin/fuse-overlayfs --storage-opt ignore_chown_errors=true "
#DOCKER_COMMAND="docker"
IMAGE_NAME=registry.bit-bots.de/ros-rolling-bitbots-projekt
SHELL="/usr/bin/zsh"
