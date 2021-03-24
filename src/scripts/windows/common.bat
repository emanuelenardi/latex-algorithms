@echo off
setlocal EnableDelayedExpansion

@REM segno di capo riga con !\n!
(set \n=^
%=Do not remove this line=%
)

@REM https://stackoverflow.com/questions/3827567/
for %%I in ("%~dp0..\..\..") do set ROOT_DIR=%%~fI
set SOURCE_DIR=%ROOT_DIR%\src
set SCRIPTS_DIR=%SOURCE_DIR%\windows
set CHAPTERS_DIR=%SOURCE_DIR%\chapters
set SETTINGS_DIR=%SOURCE_DIR%\settings
set ALGORITHMS_DIR=%SOURCE_DIR%\assets\algorithms
set BUILD_DIR=%SOURCE_DIR%\build
