FROM ros:foxy

# Arguments
ARG user
ARG uid
ARG home
ARG workspace
ARG shell

# Basic Utilities
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
  && apt-get install -y apt-utils \
  && apt-get install -y \
    build-essential \
    gdb \
    gnupg2 \
    htop \
    iproute2 \
    iputils-ping \
    ipython3 \
    less \
    libncurses5-dev \
    locales \
    python3-numpy \
    python3-opencv \
    python3-pip \
    python3-yaml \
    ranger \
    screen \
    ssh \
    sudo \
    synaptic \
    tig \
    tmux \
    tree \
    uvcdynctrl \
    vim \
    vlc \
    wget \
    x11-apps \
    zsh

# Setup locale
RUN echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Additional custom dependencies
RUN apt-get install -y \
  ros-foxy-desktop \
  ros-foxy-control-msgs \
  ros-foxy-controller-manager \
  ros-foxy-effort-controllers \
  ros-foxy-joint-state-controller \
  ros-foxy-joint-trajectory-controller \
  ros-foxy-joy \
  ros-foxy-moveit-ros-move-group \
  ros-foxy-moveit-ros-planning \
  ros-foxy-moveit-ros-planning-interface \
  ros-foxy-moveit-ros-robot-interaction \
  ros-foxy-moveit-simple-controller-manager \
  ros-foxy-navigation2 \
  ros-foxy-pointcloud-to-laserscan \
  ros-foxy-position-controllers \
  ros-foxy-robot-controllers \
  ros-foxy-robot-localization \
  ros-foxy-velocity-controllers

# Mount the user's home directory
VOLUME "${home}"

# Clone user into docker image and set up X11 sharing
RUN \
  echo "${user}:x:${uid}:${uid}:${user},,,:${home}:${shell}" >> /etc/passwd && \
  echo "${user}:x:${uid}:" >> /etc/group && \
  echo "${user} ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers"

# Switch to user
USER "${user}"
# This is required for sharing Xauthority
ENV QT_X11_NO_MITSHM=1
# Switch to the workspace
WORKDIR ${workspace}
