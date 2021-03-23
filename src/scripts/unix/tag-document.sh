#!/bin/bash

setDocumentVersion() {
  source "${BASH_SOURCE%/*}/common.sh"
  INITIAL_WORKING_DIRECTORY=$(pwd)

  documentVersion="$1"
  echo "nuova versione: $documentVersion"

  cd $SOURCE_DIR
  echo "Aggiorno versione documento."
  sed -i "s/development/${documentVersion}/" "main.tex"

  cd $CHAPTERS_DIR
  echo "Aggiorno singoli capitoli documento."
  chapters=$(find chapters/ -name "*.pdf" | cut -f 2 -d '/')
  for chapter in $chapters; do
    sed -i "s/development/${documentVersion}/" "$chapter.tex"
  done

  cd $INITIAL_WORKING_DIRECTORY
}