@echo off
call "%~dp0\common.bat"
set INITIAL_WORKING_DIRECTORY=%cd%

echo !\n!=========== CANCELLO IL PREAMBOLO PRE-COMPILATO DEL MAIN =============
cd %SETTINGS_DIR%
del /s preamble.main.fmt >nul 2>&1

echo ============== CANCELLO LOG E PREAMBOLO DEGLI ALGORITMI ==============
cd %ALGORITHMS_DIR%
del /s preamble.fmt >nul 2>&1

cd %INITIAL_WORKING_DIRECTORY%

call "%~dp0\reset-build.bat"