pdflatex -ini -jobname="00-main.preamble" "&pdflatex 00-main.preamble.sty\dump"
del 00-main.preamble.log

cd assets/algorithms
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del preamble.log
cd ..
cd ..
