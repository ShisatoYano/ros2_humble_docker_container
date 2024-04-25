# pull base image to use GPU
FROM nvidia/opengl:base-ubuntu22.04

# set as non interactive
ENV DEBIAN_FRONTEND=noninteractive

# install common tools
RUN apt update && apt install -y \
git \
vim \
wget \
gdb \
curl \
lsb-release \
gnupg2 \
locales \
&& apt clean \ 
&& rm -rf /var/lib/apt/lists/*

# create user and group
ARG UID=2000
ARG GID=2000
RUN groupadd -g $GID dev-user \
&& useradd -m -d /home/dev-user -s /bin/bash -u $UID -g $GID dev-user

# install ROS 2 Humble
# 1. set encoding to UTF-8
RUN locale-gen en_US en_US.UTF-8 \
&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 \
&& export LANG=en_US.UTF-8 \
&& locale
# 2. add ROS 2 apt repository
RUN apt install -y software-properties-common \
&& add-apt-repository universe
# 3. add ROS 2 GPG key
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
# 4. add repository to sources list
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
# 5. install packages
RUN apt update && apt upgrade -y \
&& apt install -y ros-humble-desktop
# 6. environment setup
RUN echo "source /opt/ros/humble/setup.bash" >> /home/dev-user/.bashrc
RUN printenv | grep -i ROS

# install turtlesim packages
RUN apt update && apt install -y ros-humble-turtlesim
RUN ros2 pkg executables turtlesim

# install rqt
RUN apt update && apt install -y ros-humble-rqt-*

# colcon build setup
# 1. install build tools
RUN apt install -y \
python3-colcon-common-extensions \
python3-rosdep \
python3-argcomplete