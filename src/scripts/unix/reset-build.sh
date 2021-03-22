#!/bin/bash
INITIAL_WORKING_DIRECTORY=$(pwd)

source "${BASH_SOURCE%/*}/common.sh"

cd $BUILD_DIR

[ -d "_minted-cache" ] && rm -r "_minted-cache"
[ -d "chapters" ] && rm -r "chapters"
find . -type f ! -name '.gitignore' | xargs -r rm

cd $INITIAL_WORKING_DIRECTORY