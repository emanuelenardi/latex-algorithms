#!/bin/bash

# https://gist.github.com/amberj/5166112
source "${BASH_SOURCE%/*}/rbg-colored-echo.sh"

# https://stackoverflow.com/questions/59895
ROOT_DIR="$( cd ${BASH_SOURCE%/*} && cd ../../.. >/dev/null 2>&1 && pwd )"
SOURCE_DIR="${ROOT_DIR}/src"
SCRIPTS_DIR="${SOURCE_DIR}/scripts/unix"
CHAPTERS_DIR="${SOURCE_DIR}/chapters"
SETTINGS_DIR="${SOURCE_DIR}/settings"
BUILD_DIR="${SOURCE_DIR}/build"
ALGORITHMS_DIR="${SOURCE_DIR}/assets/algorithms"