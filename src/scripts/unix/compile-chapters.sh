#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

cd $CHAPTERS_DIR
MESSAGE="\n==================== COMPILO SINGOLI CAPITOLI ====================" ; simple_blue_echo
find *.tex | xargs -n 1 -I{} arara {}

cd $BUILD_DIR
mkdir -p ./chapters
mv *.pdf ./chapters
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm

cd $INITIAL_WORKING_DIRECTORY