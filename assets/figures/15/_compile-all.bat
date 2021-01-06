@echo off

pdflatex --shell-escape -ini -jobname="main.preamble" "&pdflatex main.preamble.sty\dump"
rem _preamble.log

latexmk -C

for %%f in (*.tex) do (
    rem echo %%f
    arara %%f
)
