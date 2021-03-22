#!/bin/bash
# https://tex.stackexchange.com/a/199150/1opt27473
INITIAL_WORKING_DIRECTORY=$(pwd)

source "${BASH_SOURCE%/*}/common.sh"

cd $BUILD_DIR
pdfs=$(find . -type f -name "*.pdf")
fileTotal=$(find . -type f -name "*.pdf" | wc -l)
fileProcessed=0

OPTIONS_PSO="--use-pngout=false --use-jbig2=false --quiet"
OPTIONS_GS="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH"

optsize_tot=0
orgsize_tot=0
for file in $pdfs; do
    basename=$(basename $file)
    filebase=$(basename $file .pdf)
    
    # padding numbers
    fileProcessed=$(printf %02d "$((10#$fileProcessed + 1))")
    fileTotal=$(printf %02d "$((10#$fileTotal))")
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
        let "optsize_tot+=optsize"
        let "orgsize_tot+=optsize"

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
        
        if [[ -z "$GITHUB_ACTIONS" ]] ; then
            rm "${file}"
            mv "${optfile}" "${file}"
        else
            sudo rm "${file}"
            sudo mv "${optfile}" "${file}"
        fi

        percent=$(expr $optsize '*' 100 / $orgsize)
        echo "done (now ${percent}% of old)"
    fi
done
percent_total=$(expr $optsize_tot '*' 100 / $orgsize_tot)
echo "Before compression: ${orgsize_tot}"
echo "After compression: ${optsize_tot}, ${percent_total}% of old"

cd $INITIAL_WORKING_DIRECTORY