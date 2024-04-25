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