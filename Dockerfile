FROM texlive/texlive:latest

LABEL "repository"="https://github.com/emanuelenardi/latex-algorithms"
LABEL "homepage"="https://github.com/emanuelenardi/latex-algorithms"
LABEL "maintainer"="Emanuele Nardi <emanuele.nardi@studenti.unitn.it>"

ARG UNAME=user
ARG UID=1000
ARG GID=$UID

# mi assicuro che l'userId e il groupId corrispondano a quelli che il container usa
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

# installo le dipendenze
RUN apt-get update
RUN apt-get install python3-pygments
RUN apt-get autoclean -y && apt-get autoremove -y

# utilizzo l'utente
USER $UNAME

