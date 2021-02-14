#!/bin/bash
source "src/scripts/unix/common.sh"

# MESSAGE="\n=========== CANCELLO IL PREAMBOLO PRE-COMPILATO DEL MAIN =============" ; simple_red_echo
cd src
rm -f preamble.main.log
rm -f preamble.main.fmt

# MESSAGE="============== CANCELLO LOG E PREAMBOLO DEGLI ALGORITMI ==============" ; simple_red_echo
cd $ALGORITHMS_DIR
rm -f preamble.log
rm -f preamble.fmt

# MESSAGE="================= CANCELLO CONTENUTO CARTELLA BUILD ==================" ; simple_red_echo
cd $BUILD_DIR
if [ -d "$BUILD_DIR/chapters" ]; then rm -Rf $BUILD_DIR/chapters; fi
rm -rf *.*

cd $ROOT_DIR
