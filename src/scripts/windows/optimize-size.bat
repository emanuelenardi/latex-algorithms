@REM https://tex.stackexchange.com/questions/2198/
@REM https://tex.stackexchange.com/questions/18987/
@REM https://stackoverflow.com/questions/46195795/
@echo off
setlocal enabledelayedexpansion
@REM espansione delle variabili all'interno del for loop
@REM https://stackoverflow.com/questions/13805187/

@REM ghostscript executable name
set "ghostscript=gswin64c"

@REM extension of files to be scanned
set "ext=pdf"

@REM set variable to 0 to overwrite existing files (default) or
@REM set variable to 1 to create new files
set "createNewPDFs=0"
@REM file prefix for new files (if they should be created)
set "filepre=compressed_"

call "%~dp0\common.bat"
set INITIAL_WORKING_DIRECTORY=%cd%

cd %BUILD_DIR%

set options-pso=--use-pngout=false --use-jbig2=false --quiet
@REM -sDEVICE=<devname>  select device
@REM -dPDFSETTINGS=/printer selects output similar to the Acrobat Distiller "Print Optimized" setting.
@REM -dNOPAUSE no pause after page
@REM -dPrinted=false preserves the hyperlinks from PDFs
@REM -dBATCH  exit after last file
set options-gs=-sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dCompatibilityLevel=1.5 -dNOPAUSE -dQUIET -dBATCH -dPrinted=false

@REM counters
set files=24
set /a current_file=1

echo|set /p="[0!current_file!/%files%] compressing main.pdf ... "
@REM pdfsizeopt si comporta meglio con file di grandi dimensioni
@REM TODO controlla se la compressione è migliore una volta finito il documento
@REM TODO controlla che ghostscript non corrompa i collegamenti ipertestuali
@REM gswin64 %options-gs% -sOutputFile=main-compressed.pdf main.pdf

@REM pdfsizeopt %options-pso% "main.pdf" "main.pdf"
echo done
set /a current_file+=1
set "spaces=                  "

cd chapters
@REM loop over all files in all (sub)directories with given extension
for /f "delims=*" %%f in ('dir "*.%ext%" /b /a:-d') do (
    set basename=%%~nxf
    set filename=%%~dpnf
    set pathname=%%~dpnxf

    @REM padding
    if !current_file! LSS 10 (
        set "line=[0!current_file!/%files%] compressing !basename! ... %spaces%"
        set "line=!line:~0,52!"
        echo|set /p=!line!
        @REM echo|set /p=%line%
    ) else (
        set "line=[!current_file!/%files%] compressing !basename! ... %spaces%"
        set "line=!line:~0,52!"
        echo|set /p=!line!
        @REM echo|set /p=%line%
    )

    @REM sostituisci i file originali se più piccoli
    if [%createNewPDFs%] EQU [1] (
        %ghostscript% %options-gs% -sOutputFile="%%~dpf%filepre%%%~nxf" "%%~f"
        echo done ^(created new file^)
    ) else (
        %ghostscript% %options-gs% -sOutputFile="%TEMP%\%%~nxf" "%%~f"
        for %%t in ("%TEMP%\%%~nxf") do ( set "newSize=%%~zt" )
        for %%t in ("%%~f") do ( set "oldSize=%%~zt" )
        if [!newSize!] LSS [!oldSize!] (
            rem new file is smaller --> overwrite
            move /y "%TEMP%\%%~nxf" "%%~f" >nul
        ) else (
            rem new file is greater --> delete it of the temp dir
            del "%TEMP%\%%~nxf"
        )
        set /a diff=!newSize!*100/!oldSize!
        echo done ^(!diff!%%^)
    @REM )

    set /a current_file+=1
)

cd %INITIAL_WORKING_DIRECTORY%