@echo off

rem importo variabili globali
call "%~dp0\common.bat"

rem cls
echo(
echo CANCELLO I FILE AUSILIARI
echo(
rem @pause
call "%~dp0\reset-project.bat"

rem cls
echo(
echo COMPILO PREAMBOLO DEL MAIN
echo(
rem @pause
cd "%BASE_DIR%\settings"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
del preamble.main.log

rem cls
echo(
echo COMPILO PREAMBOLO DEGLI ALGORITMI
echo(
rem @pause
cd "%BASE_DIR%\assets\algorithms"
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del preamble.log

cd %BASE_DIR%
