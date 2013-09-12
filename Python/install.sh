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
./configure --prefix=$BASE_DIR/$CURRENT_VERSION_DIR && make install

# Link it
cd $BASE_DIR
ln -s $CURRENT_VERSION_DIR current

