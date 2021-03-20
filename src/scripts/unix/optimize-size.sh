#!/bin/bash
# https://tex.stackexchange.com/a/199150/1opt27473
INITIAL_WORKING_DIRECTORY=$(pwd)

source "${BASH_SOURCE%/*}/common.sh"

cd $BUILD_DIR
# main=$(find -name "main-*.pdf" | cut -f 2 -d '/')
# chapters=$(find chapters/ -name "*.pdf" | cut -f 2 -d '/')
pdfs=$(find . -type f -name "*.pdf")
fileTotal=$(find . -type f -name "*.pdf" | wc -l)

# echo $main
# printf '%s\n' "$chapters"
# printf '%s\n' "$pdfs"

fileProcessed=0
OPTIONS_PSO="--use-pngout=false --use-jbig2=false --quiet"
OPTIONS_GS="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH"

for file in $pdfs; do
    basename=$(basename $file)
    filebase=$(basename $file .pdf)
    
    fileProcessed=$(printf %02d "$((10#$fileProcessed + 1))")
    printf 'Compressing %s %-40s' "[$fileProcessed/$fileTotal]" "$basename ..."
    optfile="/tmp/$$-${filebase}_opt.pdf"
    
    if [[ "$basename" == "main"* ]]; then
        pdfsizeopt $OPTIONS_PSO "${file}" "${optfile}"
    else
        ghostscript $OPTIONS_GS -sOutputFile="${optfile}" "${file}"
    fi

    if [ $? == '0' ]; then
        optsize=$(stat -c "%s" "${optfile}")
        orgsize=$(stat -c "%s" "${file}")

        if [ "${optsize}" -eq 0 ]; then
            echo "No output!  Keeping original"
            rm -f "${optfile}"
            continue
        fi
        
        if [ ${optsize} -ge ${orgsize} ]; then
            echo "Didn't make it smaller! Keeping original"
            rm -f "${optfile}"
            continue
        fi
        
        # bytesSaved=$(expr $orgsize - $optsize)
        percent=$(expr $optsize '*' 100 / $orgsize)
        rm "${file}"
        mv "${optfile}" "${file}"

        echo "done (now ${percent}% of old)"
    fi
done

cd $INITIAL_WORKING_DIRECTORY