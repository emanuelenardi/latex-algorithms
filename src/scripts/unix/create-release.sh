#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

cd $BUILD_DIR
cp ./main.pdf ./"Dispenda Algoritmi e Strutture Dati ($(date +'%Y.%m.%d_%H.%M'))".pdf
# zip -r "release-$(date +"%Y.%m.%d_%H.%M").zip" chapters main.pdf

cd $INITIAL_WORKING_DIRECTORY
