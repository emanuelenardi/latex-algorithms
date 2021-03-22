#!/bin/bash

# https://gist.github.com/amberj/5166112
source "${BASH_SOURCE%/*}/rbg-colored-echo.sh"

# https://stackoverflow.com/questions/59895
ROOT_DIR="$( cd ${BASH_SOURCE%/*} && cd ../../.. >/dev/null 2>&1 && pwd )"
SRC_DIR="${ROOT_DIR}/src"
SCRIPTS_DIR="${SRC_DIR}/scripts/unix"
CHAPTERS_DIR="${SRC_DIR}/chapters"
SETTINGS_DIR="${SRC_DIR}/settings"
BUILD_DIR="${SRC_DIR}/build"
ALGORITHMS_DIR="${SRC_DIR}/assets/algorithms"