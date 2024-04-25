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
