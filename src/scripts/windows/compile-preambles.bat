@echo off
set INITIAL_WORKING_DIRECTORY=%cd%
call "%~dp0\common.bat"

echo: & echo ==================== COMPILO PREAMBOLO PRINCIPALE ==================== & echo:
cd "%SETTINGS_DIR%"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
del /s preamble.main.log >nul 2>&1

@REM echo: & echo ==================== COMPILO PREAMBOLO ALGORITMI ==================== & echo:
@REM cd "%ALGORITHMS_DIR%"
@REM pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
@REM del /s preamble.log >nul 2>&1
cls

cd %INITIAL_WORKING_DIRECTORY%