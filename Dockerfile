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
###
FROM ubuntu
MAINTAINER Gianluca Casati <casati_gianluca@yahoo.it>

# Install base requirements
RUN apt-get update -y && apt-get install -y \
    make gcc wget tar git gzip findutils

# Install dotsoftware pointing to /usr/local
RUN cd; \
    git clone https://github.com/fibo/.software.git; \
    echo 'export DOTSOFTWARE_ROOT_DIR=/usr/local' \
    >> /root/.bashrc; \
    echo '. $HOME/.software/etc/profile' \
    >> /root/.bashrc
