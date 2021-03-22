#!/bin/bash

setDocumentVersion() {
    documentVersion="$1"
    echo "nuova versione: $documentVersion"

    source "${BASH_SOURCE%/*}/common.sh"
    cd $SOURCE_DIR
    echo "Aggiorno versione documento."
    sed -i "s/VERSIONE/${documentVersion}/g" "main.pdf"
}