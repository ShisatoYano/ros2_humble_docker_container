# pull base image to use GPU
FROM nvidia/opengl:base-ubuntu22.04

# set as non interactive
ENV DEBIAN_FRONTEND=noninteractive