@echo off

rem importo variabili globali
call "%~dp0\common.bat"

echo(
echo CANCELLO I FILE AUSILIARI
echo(
call "%~dp0\reset-project.bat"

echo(
echo COMPILO PREAMBOLO DEL MAIN
echo(
cd "%BASE_DIR%\settings"
pdflatex --shell-escape --interaction=batchmode -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
del preamble.main.log

echo(
echo COMPILO PREAMBOLO DEGLI ALGORITMI
echo(
cd "%BASE_DIR%\assets\algorithms"
pdflatex --interaction=batchmode -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del preamble.log

cd %BASE_DIR%
