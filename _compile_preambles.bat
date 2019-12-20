REM compilo preambolo principale
pdflatex -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"

REM nel caso utilizzassi 'minted'
REM pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"

del preamble.main.log

REM compilo prambolo algoritmi
cd assets/algorithms
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del preamble.log
cd ..
cd ..
