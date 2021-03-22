#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

MESSAGE="\n==================== COMPILO DOCUMENTO PRINCIPALE ====================" ; simple_blue_echo
cd $SOURCE_DIR
arara -v main

cd $BUILD_DIR
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm
# rm -r _minted-*

cd $INITIAL_WORKING_DIRECTORY
