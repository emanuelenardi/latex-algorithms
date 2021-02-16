#!/bin/bash

# https://gist.github.com/amberj/5166112
source "src/scripts/unix/rbg-colored-echo.sh"

# https://stackoverflow.com/questions/59895
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../../.. >/dev/null 2>&1 && pwd )"
SRC_DIR="${ROOT_DIR}/src"
SCRIPT_DIR="${SRC_DIR}/script/unix"
CHAPTERS_DIR="${SRC_DIR}/chapters"
SETTINGS_DIR="${SRC_DIR}/settings"
BUILD_DIR="${SRC_DIR}/build"
ALGORITHMS_DIR="${SRC_DIR}/assets/algorithms"