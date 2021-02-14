#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

cd $BUILD_DIR
zip -r "release-$(date +"%Y.%m.%d_%H.%M").zip" chapters main.pdf

cd $INITIAL_WORKING_DIRECTORY
