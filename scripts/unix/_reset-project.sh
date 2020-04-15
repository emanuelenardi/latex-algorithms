#!/bin/sh
echo "cancello il preambolo pre-compilato del main"
echo "cancello le cache di minted"
cd settings
rm -r _minted-cache
rm preamble.main.log
rm preamble.main.fmt
cd ../..

echo "cancello il preambolo degli algoritmi"
cd assets/algorithms
rm preamble.log
rm preamble.fmt
cd ../../..

cd chapters
rm -r _minted-cache
latexmk -C
rm *.loc
rm *.soc

cd revise
rm -r _minted-cache
latexmk -C
rm *.loc
rm *.soc

cd ../../..

echo "pulizia dei file generali"
latexmk -C

echo "cancello versioni di stampa"
rm main-bw.pdf
rm main-cl.pdf

echo "rientro nella cartella degli scripts"
cd scripts
