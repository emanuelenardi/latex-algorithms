[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-science.svg)](https://forthebadge.com)

<!-- [![forthebadge](https://forthebadge.com/images/badges/cc-by-nd.svg)](https://forthebadge.com) -->

# Appunti di Algoritmi e Strutture Dati

[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)
[![GitHub tag](https://img.shields.io/github/tag/emanuelenardi/algorithms.svg)](https://gitHub.com/emanuelenardi/algorithms/tags/)

Questi sono gli appunti presi in preparazione all'esame di Algoritmi e Strutture Dati tenuto all'Università degli Studi di Trento dal Prof.re Alberto Montresor.

## Ringraziamenti

Vorrei ringraziare _Francesco Bozzo_ e _Samuele Conti_ per aver revisionato questa dispensa, per la considerevole pazienza e meticolosità delle correzioni.
Le carenze di questa dispensa sarebbero considerevolmente maggiori e più numerose se non fosse stato per la loro assistenza.
Gli errori rimanenti sono, ovviamente, interamente miei.

## Segnalazione errori

Se trovi errori di qualsiasi natura non avere remure a segnalarmeli, li correggerò il prima possibile e aggiornerò l'errata corrige, inoltre (se ti fa piacere) verrai menzionato vicino all'errore segnalato.
Una versione pubblica e aggiornata dell'errata corrige sarà presente alla pagina "[Errata corrige](https://github.com/emanuelenardi/algorithms/wiki/errata)" nella Wiki del progetto.

## Contenuto 📖

-   1° Semetre

	| no. | Presente | Titolo                          | no. pagine |
	| --- | -------- | ------------------------------- | --- |
	| 1   | ✔️       | Introduzione                    | 7  |
	| 2   | ✔️       | Analisi di algoritmi            | 21 |
	| 2   | ✔️       | Analisi delle funzioni di costo | 20 |
	| 3   | ❌       | Analisi ammortizzata            | -  |
	| 4   | ✔️       | Strutture Dati                  | 11 |
	| 5   | ✔️       | Alberi                          | 9  |
	| 6   | ✔️       | Alberi Binari di Ricerca        | 20 |
	| 7   | ❌       | Hashing                         | -  |
	| 8   | ✔️       | Insiemi e dizionari             | 4  |
	| 9   | ✔️       | Grafi                           | 32 |
	| 10  | ❌       | Strutture dati speciali         | -  |
	| 11  | ✔️       | "Scelta"                        | 10 |
	| 12  | ✔️       | Divide et Impera                | 7  |

-   2° Semetre

	| no. | Presente | Titolo                                | no. pagine |
	| --- | -------- | ------------------------------------- | --- |
	| 13  | ❌       | Programmazione Dinamica               | -  |
	| 14  | ✔️       | Algoritmi ingordi                     | 14 |
	| 15  | ❌       | Ricerca locale                        | -  |
	| 16  | ✔️       | Backtrack                             | 10 |
	| 17  | ❌       | Algoritmi probabilistici              | -  |
	| 18  | ❌       | Problemi intrattabili                 | -  |
	| 19  | ❌       | Soluzioni per problemi intrattabili   | 5  |

-   Appendici

	| no. | Presente | Titolo                          | no. pagine |
	| --- | -------- | ------------------------------- | --- |
	| A1  | ✔️       | Problema dell'ordinamento       | -  |

## Licenza 📃

> Gli elaborati presenti in questa repository sono basati sulle trasparenze e gli appunti del Prof.re Alberto Montresor, i quali sono rilasciati sotto licenza [CC BY-NC 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

## Requisiti per la compilazione

Per poter compilare questo progetto è necessario avere sulla propria macchina:
- un'installazione **completa** di [TeX-Live](https://www.tug.org/texlive/acquire-netinstall.html) 2020 (servono all'incirca 7GB liberi sul disco)
- [python](https://www.python.org/downloads/) (`2.x.x` o `3..x.x` è indifferente)
- la libreria python [`pygmetize`](https://pygments.org/)

## Come compilare il progetto

Nella cartelle `windows/scripts` e `unix/scripts` sono presenti gli _scripts_ necessari per la compilazione del progetto in Windows e Linux/Mac rispettivamente.

Per compilare il progetto, una volta soddisfatti i requisiti, eseguire dalla cartella _root_:
```bash
unix/scripts/compile-preambles # pre-compilo i preamboli
unix/scripts/compile-project   # produco il pdf
```
I comandi sono equivalenti per la piattaforma Windows utilizzando gli script sull'omonima cartella.

## Effettuare modifiche al preambolo del documento

Nel caso si eseguissero modifiche al file `settings/preamble.main` è necessario compilarlo nuovamente per vedere il risultato delle proprie modifiche riflesse sul documento finale.
```bash
unix/scripts/compile-preambles # pre-compilo i preamboli
arara main
```
