REM cancello il preambolo pre-compilato del main
REM cancello le cache di minted
cd settings
rmdir /q /s _minted-cache
del preamble.main.log
del preamble.main.fmt
cd ..

REM cancello il preambolo degli algoritmi
cd assets/algorithms
del preamble.log
del preamble.fmt
cd ../..

cd chapters
rmdir /q /s _minted-cache
latexmk -C
del *.loc
del *.soc

cd revise
rmdir /q /s _minted-cache
latexmk -C
del *.loc
del *.soc

cd ../..

REM pulizia dei file generali
latexmk -C

REM cancello versioni di stampa
del main-bw.pdf
del main-cl.pdf

REM rientro nella cartella degli scripts
cd scripts
