#!/bin/bash

INITIAL_WORKING_DIRECTORY=$(pwd)

source "src/scripts/unix/reset-project.sh"
source "src/scripts/unix/compile-preambles.sh"
source "src/scripts/unix/compile-chapters.sh"
source "src/scripts/unix/compile-main.sh

cd $INITIAL_WORKING_DIRECTORY