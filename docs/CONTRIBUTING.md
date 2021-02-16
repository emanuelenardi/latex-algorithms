# Contributing to this repository

## Requisiti per la compilazione

Per poter compilare questo progetto è necessario avere sulla propria macchina:

- un'installazione completa di [TeX-Live](https://www.tug.org/texlive/acquire-netinstall.html) 2020 (servono all'incirca 7GB liberi sul disco)
- [python](https://www.python.org/downloads/) (`2.x.x` o `3..x.x` è indifferente)
- la libreria python [`pygmetize`](https://pygments.org/)
- java

```bash
src/unix/scripts/compile-project.sh
```

## Come compilare il progetto

Nella cartelle `src/windows/scripts` e `src/unix/scripts` sono presenti gli _scripts_ necessari per la compilazione del progetto in Windows e Linux/Mac rispettivamente.

Per compilare il progetto, una volta soddisfatti i requisiti, eseguire dalla cartella _root_:

```bash
src/unix/scripts/compile-project.sh
```

Lo script è composto a sua volta da altri script, contenuti nella stessa cartella, quali:

- `reset-project.sh`: cancella il preambolo precompilato del documento principale e degli algoritmi, cancella inoltre il contenuto della cartella `build`;
- `compile-preambles.sh`: precompila i preamboli del documento principale e degli algoritmi per migliorare la velocità di compilazione;
- `compile-main.sh`: compila solo il documento principale
- `compile-chapters.sh`: compila ogni singolo capitolo e li mette nella cartella `build/chapters`

I comandi sono equivalenti per la piattaforma Windows utilizzando gli script sull'omonima cartella.

### Effettuare modifiche al preambolo del documento

Nel caso si eseguissero modifiche al file `settings/preamble.main.sty` è necessario compilarlo nuovamente per vedere il risultato delle proprie modifiche riflesse sul documento finale.

```bash
unix/scripts/compile-preambles # pre-compilo i preamboli
unix/scripts/compile-main
```
