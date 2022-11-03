#!/bin/sh


#Execute from root directory
ROOT=$PWD
cd $ROOT/tools
git clone https://github.com/google/googletest.git && \
mkdir $ROOT/build
cd $ROOT/build
