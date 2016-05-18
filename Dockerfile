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

# Install base requirements
RUN apt-get update -y && apt-get install -y \
    make gcc wget tar git gzip findutils

# Create a dotsoftware_install wrapper
RUN cd; \
    git clone https://github.com/fibo/.software.git; \
    echo '#!/bin/bash' \
    >> /usr/local/bin/dotsoftware_install; \
    echo 'export DOTSOFTWARE_ROOT_DIR=/usr/local' \
    >> /usr/local/bin/dotsoftware_install; \
    echo 'source $HOME/.software/etc/profile' \
    >> /usr/local/bin/dotsoftware_install; \
    echo '.software_install $1 $2' \
    >> /usr/local/bin/dotsoftware_install; \
    chmod +x /usr/local/bin/dotsoftware_install
