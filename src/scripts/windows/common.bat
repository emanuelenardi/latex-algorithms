@echo off

@REM https://stackoverflow.com/questions/3827567/
for %%I in ("%~dp0..\..\..") do set ROOT_DIR=%%~fI
set SRC_DIR=%ROOT_DIR%\src
set SCRIPTS_DIR=%SRC_DIR%\windows
set CHAPTERS_DIR=%SRC_DIR%\chapters
set SETTINGS_DIR=%SRC_DIR%\settings
set ALGORITHMS_DIR=%SRC_DIR%\assets\algorithms
set BUILD_DIR=%SRC_DIR%\build