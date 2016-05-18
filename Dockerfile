# dot software Ubuntu base image
#
# How it was deployed on https://hub.docker.com/r/fibo/dotsoftware/
#
# ```
# docker build -t fibo/dotsoftware .
# docker login
# docker push fibo/dotsoftware
# ```
#
# Enter into the container as usual
#
# ```
# docker run -t -i fibo/dotsoftware /bin/bash
# ```
###
FROM ubuntu
MAINTAINER Gianluca Casati <casati_gianluca@yahoo.it>

# Use bash instead of dash
RUN rm /bin/sh; \
    ln -s /bin/bash /bin/sh

# Install base requirements
RUN apt-get update -y && apt-get install -y \
    make gcc wget tar git gzip findutils

# Install dotsoftware
RUN cd; \
    git clone https://github.com/fibo/.software.git; \
    echo 'export DOTSOFTWARE_ROOT_DIR=/usr/local' \
    >> /root/.bashrc; \
    echo '. $HOME/.software/etc/profile' \
    >> /root/.bashrc
