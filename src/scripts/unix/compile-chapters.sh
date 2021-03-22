#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

cd $CHAPTERS_DIR
MESSAGE="\n==================== COMPILO SINGOLI CAPITOLI =======================" ; simple_blue_echo
find *.tex | xargs -n 1 -I{} arara {}

cd $BUILD_DIR
mkdir -p ./chapters
find -name "*.pdf" ! -name "main.pdf" | xargs -n 1 -I{} mv -v {} ./chapters
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm
# rm -r _minted-cache

cd $INITIAL_WORKING_DIRECTORY
