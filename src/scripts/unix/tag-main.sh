#!/bin/bash

setDocumentVersion() {
    source "${BASH_SOURCE%/*}/common.sh"
    INITIAL_WORKING_DIRECTORY=$(pwd)
    
    documentVersion="$1"
    echo "nuova versione: $documentVersion"

    cd $SOURCE_DIR
    echo "Aggiorno versione documento."
    sed -i "s/development/${documentVersion}/g" "main.tex"
    cd $INITIAL_WORKING_DIRECTORY
}