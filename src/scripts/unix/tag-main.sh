#!/bin/bash

print_var () {
    var=$1
    printf '%-14s %s\n' "$var:" "${!var}"
}

setDocumentVersion() {
    source "${BASH_SOURCE%/*}/common.sh"
    
    documentVersion="$1"
    echo "nuova versione: $documentVersion"

    INITIAL_WORKING_DIRECTORY=$(pwd)

    cd "$BUILD_DIR"
    MAIN_DOC=$(find -name "main*.pdf")

    echo ""
    if [[ -f "$MAIN_DOC" ]]; then
        main_name=$(find -name "main*.pdf" | cut -f 2 -d '/')
        print_var "main_name"
        main_basename="${main_name%.*}"
        print_var "main_basename"
        main_tagged="$main_basename-tagged.tex"
        print_var "main_tagged"
    else 
        echo "main document does not exist."
        exit
    fi
    echo ""
    
    echo "Copio $main_tagged nella cartella build."
    if [[ ! -f "$BUILD_DIR/$main_tagged" ]]; then
        cd $SCRIPTS_DIR

        local_tex=tag-main.tex # stesso nome dello script
        cp "$local_tex" "$BUILD_DIR/$main_tagged"
        
        cd $BUILD_DIR
    else 
        echo "$main_tagged document already exists."
    fi
    
    echo "Aggiorno versione documento." && echo ""
    sed -i "s/VERSIONE/${documentVersion}/g" "$main_tagged"

    echo "Compilo il nuovo documento."
    arara $main_tagged
    main_tagged="${main_tagged%.*}.pdf"

    echo "" && echo "Rimuovo file ausiliari."
    find . -type f ! -name '*.pdf' ! -name '.gitignore' | xargs -r rm

    echo "Sostitusco $main_tagged con $main_name."
    rm "$main_name"
    mv "$main_tagged" "$main_name"


    cd $INITIAL_WORKING_DIRECTORY
}