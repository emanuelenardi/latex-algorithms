del preamble.main.log
del preamble.main.fmt

rmdir _minted-cache
rmdir _minted-preamble.main

REM compilo prambolo algoritmi
cd assets/algorithms
del preamble.log
del preamble.fmt
cd ../..

latexmk -C
