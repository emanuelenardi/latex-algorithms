@echo off
set INITIAL_WORKING_DIRECTORY=%cd%
call "%~dp0\common.bat"

echo !\n!==================== COMPILO PREAMBOLO PRINCIPALE ====================!\n!
cd "%SETTINGS_DIR%"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
del /s preamble.main.log >nul 2>&1

echo !\n!==================== COMPILO PREAMBOLO ALGORITMI ====================!\n!
cd "%ALGORITHMS_DIR%"
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
del /s preamble.log >nul 2>&1
cls

cd %INITIAL_WORKING_DIRECTORY%