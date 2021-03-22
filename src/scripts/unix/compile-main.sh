#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

MESSAGE="\n==================== COMPILO DOCUMENTO PRINCIPALE ====================" ; simple_blue_echo
cd $SOURCE_DIR

setDocumentVersion() {
    documentVersion="$1"
    echo "nuova versione: $documentVersion"

    cd $SOURCE_DIR
    echo "Aggiorno versione documento."
    sed -i "s/VERSIONE/${documentVersion}/g" "main.pdf"
}
setDocumentVersion v0.0.0
arara main

cd $BUILD_DIR
find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm
# rm -r _minted-*

cd $INITIAL_WORKING_DIRECTORY
