export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

export PROMPT="%K{black} 🐋 %K{blue}%F{black}%/ %f%k%F{blue}%f "  # Prefix the prompt with DOCKER

export HISTFILE=$HOME/.zsh_history_docker

source /opt/ros/rolling/setup.zsh &> /dev/null
source $HOME/colcon_ws/install/setup.zsh &> /dev/null

export PYTHONWARNINGS=ignore:::setuptools.command.install,ignore:::setuptools.command.easy_install,ignore:::pkg_resources
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

export ROS_DOMAIN_ID=42
