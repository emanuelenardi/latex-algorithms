#!/bin/bash
# https://tex.stackexchange.com/a/199150/1opt27473
INITIAL_WORKING_DIRECTORY=$(pwd)

source "${BASH_SOURCE%/*}/common.sh"

variable=82
separator=$(printf '%0.s=' $(seq 1 $variable))

cd $BUILD_DIR
pdfs=$(find . -type f -name "*.pdf")
fileTotal=$(find . -type f -name "*.pdf" | wc -l)
fileProcessed=0

if [[ ${fileTotal} -eq 0 ]]; then
    echo "Build folder is empty."
    exit 1
fi

OPTIONS_PSO="--use-pngout=false --use-jbig2=false --quiet"
OPTIONS_GS="-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH"

optsize_tot=0
orgsize_tot=0
echo "${separator}"
for file in $pdfs; do
    basename=$(basename $file)
    filebase=$(basename $file .pdf)
    
    # padding numbers
    fileProcessed=$(printf %02d "$((10#$fileProcessed + 1))")
    fileTotal=$(printf %02d "$((10#$fileTotal))")
    printf 'Compressing %s %-40s' "[$fileProcessed/$fileTotal]" "$basename ..."
    optfile="/tmp/$$-${filebase}_opt.pdf"
    
    # NOTE pdfsizeopt si comporta meglio con i file di grandi dimensioni
    if [[ "$basename" == "main"* ]]; then
        pdfsizeopt $OPTIONS_PSO "${file}" "${optfile}"
    else
        ghostscript $OPTIONS_GS -sOutputFile="${optfile}" "${file}"
    fi

    if [ $? == '0' ]; then
        optsize=$(stat -c "%s" "${optfile}")
        orgsize=$(stat -c "%s" "${file}")
        let "optsize_tot+=optsize"
        let "orgsize_tot+=orgsize"

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
echo "${separator}"
percent_total=$(expr $optsize_tot '*' 100 / $orgsize_tot)
orgsize_tot_mb=$(echo "scale=2; $orgsize_tot / 1000000" | bc)
optsize_tot_mb=$(echo "scale=2; $optsize_tot / 1000000" | bc)
printf "Before compression: %-4s Mb\n" "$orgsize_tot_mb"
printf "After compression:  %-4s Mb, %s%% of old\n" "$optsize_tot_mb" "$percent_total"
echo "${separator}"

cd $INITIAL_WORKING_DIRECTORY