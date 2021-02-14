@echo off

rem importo variabili globali
call "%~dp0\common.bat"

cd %BASE_DIR%\settings

echo cancello il preambolo pre-compilato del main
del /s preamble.main.log >nul 2>&1
del /s preamble.main.fmt >nul 2>&1

echo cancello le cache di minted
rmdir /q /s _minted-cache >nul 2>&1

echo cancello log e preambolo degli algoritmi
cd %BASE_DIR%\assets\algorithms
del /s preamble.log >nul 2>&1
del /s preamble.fmt >nul 2>&1

cd %BASE_DIR%\chapters

echo cancello le cache di minted
rmdir /q /s _minted-cache >nul 2>&1

echo pulizia dei file ausiliari dei capitoli
latexmk -C
del /s *.loc >nul 2>&1
del /s *.soc >nul 2>&1

echo pulizia dei file generali
cd %BASE_DIR%
latexmk -C

echo cancello le versioni di stampa
del /s main-bw.pdf >nul 2>&1
del /s main-cl.pdf >nul 2>&1
