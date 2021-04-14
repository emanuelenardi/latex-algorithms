#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

cd $ALGORITHMS_DIR
MESSAGE="\n================ ELIMINO ALGORITMI COMPILATI ===================" ; simple_blue_echo
find -name "*.pdf" | xargs -L1 -I{} rm {}

MESSAGE="\n================= COMPILO SINGOLI ALGORITMI ====================" ; simple_blue_echo
for folder in */ ; do
    cd $folder
    echo ""
    FOLDER=$(basename "`pwd`" | tr a-z A-Z)
    printf '=========================== %-9s ==========================\n' "$FOLDER"
    find -maxdepth 1 -name "*.tex" | xargs -L1 -I{} basename "{}" | xargs -L1 -I{} arara {}
    cd ..
done

cd $INITIAL_WORKING_DIRECTORY
