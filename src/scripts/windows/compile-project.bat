@echo off
call "%~dp0\common.bat"
set INITIAL_WORKING_DIRECTORY=%cd%

call "%~dp0\reset-project.bat"
call "%~dp0\compile-preambles.bat"
call "%~dp0\compile-chapters.bat"
call "%~dp0\compile-main.bat"
@REM call "%~dp0\optimize-size.bat"

cd %INITIAL_WORKING_DIRECTORY%