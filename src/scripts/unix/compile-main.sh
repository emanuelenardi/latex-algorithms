#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

# MESSAGE="\n==================== COMPILO DOCUMENTO PRINCIPALE ====================" ; simple_blue_echo
cd $SRC_DIR
arara -v main
cd $BUILD_DIR
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm
rm -r _minted-*

cd $INITIAL_WORKING_DIRECTORY
