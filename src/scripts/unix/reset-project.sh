#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

MESSAGE="\n=========== CANCELLO IL PREAMBOLO PRE-COMPILATO DEL MAIN =============" ; simple_red_echo
cd $SRC_DIR
rm -f preamble.main.log
rm -f preamble.main.fmt

MESSAGE="============== CANCELLO LOG E PREAMBOLO DEGLI ALGORITMI ==============" ; simple_red_echo
cd $ALGORITHMS_DIR
rm -f preamble.log
rm -f preamble.fmt

MESSAGE="================= CANCELLO CONTENUTO CARTELLA BUILD ==================" ; simple_red_echo
cd $BUILD_DIR
if [ -d "$BUILD_DIR/chapters" ]; then rm -Rf $BUILD_DIR/chapters; fi
if [ -d "$BUILD_DIR/_minted-cache" ]; then rm -Rf $BUILD_DIR/_minted-cache; fi
rm -f *.*

cd $INITIAL_WORKING_DIRECTORY