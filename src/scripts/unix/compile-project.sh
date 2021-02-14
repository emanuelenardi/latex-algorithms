#!/bin/bash

INITIAL_WORKING_DIRECTORY=$(pwd)

source "src/scripts/unix/common.sh"
# for debugging purposes
# MESSAGE="=================== STAMPA VARIABILI PATH PROGETTO ===================" ; simple_blue_echo
# echo -e "${BLUE_COLOR}ROOT_DIR${RESET_COLOR} = $ROOT_DIR"
# echo -e "${BLUE_COLOR}SRC_DIR${RESET_COLOR} = $SRC_DIR"
# echo -e "${BLUE_COLOR}SCRIPT_DIR${RESET_COLOR} = $SCRIPT_DIR"
# echo -e "${BLUE_COLOR}CHAPTERS_DIR${RESET_COLOR} = $CHAPTERS_DIR"
# echo -e "${BLUE_COLOR}SETTINGS_DIR${RESET_COLOR} = $SETTINGS_DIR"
# echo -e "${BLUE_COLOR}BUILD_DIR${RESET_COLOR} = $BUILD_DIR"
# echo -e "${BLUE_COLOR}ALGORITHMS_DIR${RESET_COLOR} = $ALGORITHMS_DIR"

# source "src/scripts/unix/reset-project.sh"
source "src/scripts/unix/compile-preambles.sh"
# source "src/scripts/unix/compile-chapters.sh"
source "src/scripts/unix/compile-main.sh"

cd $INITIAL_WORKING_DIRECTORY
