#!/bin/bash
source "$(dirname $0)/common"

echo "cancello il preambolo pre-compilato del main"
cd $SETTINGS_DIR
rm -f preamble.main.log
rm -f preamble.main.fmt

echo "cancello log e preambolo degli algoritmi"
cd $ALGORITHMS_DIR
rm -f preamble.log
rm -f preamble.fmt

echo "cancello contenuto cartella build"
cd $BUILD_DIR
if [ -d "$BUILD_DIR\chapters" ]; then rm -Rf $BUILD_DIR\chapters; fi
rm -rf *.*

cd $SRC_DIR
