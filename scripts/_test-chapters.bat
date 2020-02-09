cd ../chapters

arara 02-analisi
arara 03-funzioni
arara 04-strutture
arara 05-alberi
arara 06-abr
arara 08-insiemi-dizionari
arara 09-grafi
arara 12-dividi

rmdir /q /s _minted-cache
del *.loc
del *.soc

cd revise

arara 03-funzioni-added
arara 11-scelta
arara 13-dp
arara 14-greedy
arara 15-local
arara 16-backtrack
arara 17-prob
arara 19-approx

rmdir /q /s _minted-cache
del *.loc
del *.soc

cd ../../scripts
