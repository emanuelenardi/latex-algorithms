REM cancello il preambolo pre-compilato del main
REM cancello le cache di minted
cd settings
rmdir _minted-cache
del preamble.main.log
del preamble.main.fmt
cd ..

REM cancello il preambolo degli algoritmi
cd assets/algorithms
del preamble.log
del preamble.fmt
cd ../..

REM pulizia dei file generali
latexmk -C

REM rientro nella cartella degli scripts
cd scripts
