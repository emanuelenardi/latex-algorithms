#!/bin/bash
source "src/scripts/unix/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

MESSAGE="\n==================== COMPILO PREAMBOLO PRINCIPALE ====================" ; simple_blue_echo
cd $SETTINGS_DIR
# pdflatex --interaction=batchmode --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
pdflatex --shell-escape -ini -jobname="preamble.main" "&pdflatex ./preamble.main.sty\dump"
rm -f preamble.main.log

MESSAGE="\n==================== COMPILO PREAMBOLO ALGORITMI =====================" ; simple_blue_echo
cd $ALGORITHMS_DIR
# pdflatex --interaction=batchmode -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
pdflatex -ini -jobname="preamble" "&pdflatex preamble.sty\dump"
rm -f preamble.log

cd $INITIAL_WORKING_DIRECTORY
