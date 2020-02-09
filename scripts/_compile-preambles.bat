REM esco dalla directory 'scripts'
cd ..

REM entro nella cartella contenente il preambolo del documento principale
cd settings

REM compilo preambolo principale
REM pdflatex -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
REM nel caso utilizzassi 'minted', ad esempio nel capitolo 3
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"

REM rimuovo un file ausiliario creato dalla compilazione
del preamble.main.log

REM esco dalla cartella 'settings'
cd ..

REM entro nella cartella contenente il preambolo degli algoritmi
cd assets/algorithms

REM compilo prambolo algoritmi
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"

REM rimuovo un file ausiliario creato dalla compilazione
del preamble.log

REM esco dalla cartella 'assets/algorithms'
cd ../..

REM rientro nella cartella degli scripts
cd scripts
