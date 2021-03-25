@echo off

@REM https://stackoverflow.com/questions/3827567/
for %%I in ("%~dp0..\..\..") do set ROOT_DIR=%%~fI
set SOURCE_DIR=%ROOT_DIR%\src
set SCRIPTS_DIR=%SOURCE_DIR%\windows
set CHAPTERS_DIR=%SOURCE_DIR%\chapters
set SETTINGS_DIR=%SOURCE_DIR%\settings
set ALGORITHMS_DIR=%SOURCE_DIR%\assets\algorithms
set BUILD_DIR=%SOURCE_DIR%\build

@REM echo:
@REM echo SOURCE_DIR     = %SOURCE_DIR%
@REM echo SCRIPTS_DIR    = %SCRIPTS_DIR%
@REM echo CHAPTERS_DIR   = %CHAPTERS_DIR%
@REM echo SETTINGS_DIR   = %SETTINGS_DIR%
@REM echo ALGORITHMS_DIR = %ALGORITHMS_DIR%
@REM echo BUILD_DIR      = %BUILD_DIR%
@REM echo: