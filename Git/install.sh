#!/bin/bash

source $(dirname $0)/installrc

# Get sources
cd $SOURCES_DIR
wget -N $SOURCES_URI

SOURCES_FILENAME=$(basename $SOURCES_URI)
CURRENT_VERSION_DIR=$(tar tzf $SOURCES_FILENAME | head -1)

# Exctract
cd $BUILD_DIR
tar xzf $SOURCES_DIR/$SOURCES_FILENAME

# Build
cd $CURRENT_VERSION_DIR

PERL=$(which perl)
PYTHON=$(which python)

./configure --prefix=$BASE_DIR/$CURRENT_VERSION_DIR --with-perl=$PERL --with-python=$PYTHON && make install

# Link it
cd $BASE_DIR
rm current 2> /dev/null
ln -s $CURRENT_VERSION_DIR current

