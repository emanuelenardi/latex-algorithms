@echo off
set INITIAL_WORKING_DIRECTORY=%cd%
call "%~dp0\common.bat"

echo: & echo ==================== COMPILO SINGOLI CAPITOLI =================== & echo:
cd %CHAPTERS_DIR%
@REM https://stackoverflow.com/a/9429985/6505634
for /F %%x in ('dir /B *.tex') do (
	arara %%x
)

cd %BUILD_DIR%
@REM rmdir /q /s _minted-cache >nul 2>&1
del /s *.aux >nul 2>&1
del /s *.log >nul 2>&1

mkdir chapters
for %%i in (*.pdf) do (
	if not "%%i"=="main.pdf" (
		move "%%i" chapters
	)
)

cd %INITIAL_WORKING_DIRECTORY%
