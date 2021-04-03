@echo off
@REM SEE https://stackoverflow.com/questions/33276921
@REM SEE https://stackoverflow.com/questions/23228983

set back="%cd%"

set chapters=02 04 05 06 08 09 10 11 12 13 14 15 16 19 searching sorting

for /d %%d in (%chapters%) do (
    echo(
    echo ========================= CAPITOLO %%d
    cd "%~dp0%%d"
    latexmk -C

    for %%f in (*.tex) do (
        echo(
        echo FILE %%f
        arara %%f
    )
)

cd %back%
