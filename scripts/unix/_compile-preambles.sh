#!/bin/sh
echo "esco dalla directory 'scripts'"
cd ../..

echo "entro nella cartella contenente il preambolo del documento principale"
cd settings

echo "compilo preambolo principale"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"

echo "rimuovo un file ausiliario creato dalla compilazione"
rm preamble.main.log

echo "esco dalla cartella 'settings'"
cd ../..

echo "entro nella cartella contenente il preambolo degli algoritmi"
cd assets/algorithms

echo "compilo prambolo algoritmi"
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"

echo "rimuovo un file ausiliario creato dalla compilazione"
rm preamble.log

echo "esco dalla cartella 'assets/algorithms'"
cd ../../..

echo "rientro nella cartella degli scripts"
cd scripts
