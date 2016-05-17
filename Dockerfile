# dot software Ubuntu base image
#
# https://hub.docker.com/r/fibo/dotsoftware/
#
# How to build:
#
# docker build -t dotsoftware .
#
FROM ubuntu
MAINTAINER Gianluca Casati <casati_gianluca@yahoo.it>

# Install base requirements
RUN apt-get update -y && apt-get install -y make gcc wget tar git gzip findutils

ENV DOTSOFTWARE_ROOT_DIR /usr/local

RUN echo export DOTSOFTWARE_ROOT_DIR=$DOTSOFTWARE_ROOT_DIR >> /etc/profile
RUN echo source $DOTSOFTWARE_ROOT_DIR/.software/etc/profile >> /etc/profile

RUN cd $DOTSOFTWARE_ROOT_DIR && git clone https://github.com/fibo/.software.git
