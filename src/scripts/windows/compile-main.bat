@echo off
set INITIAL_WORKING_DIRECTORY=%cd%
call "%~dp0\common.bat"

echo: & echo ==================== COMPILO DOCUMENTO PRINCIPALE ====================& echo:
cd %SOURCE_DIR%
arara -v main

cd %BUILD_DIR%
echo: & ===================== EFFETTUO PULIZIA FILE AUX =====================& echo:
@REM evito di cancellare la cache per le run successive
@REM rmdir /q /s _minted-cache >nul 2>&1
@REM Delete all files EXCEPT a given extension
for /f %%F in ('dir /b /a-d ^| findstr /vile ".gitignore .pdf"') do del "%%F"

cd %INITIAL_WORKING_DIRECTORY%