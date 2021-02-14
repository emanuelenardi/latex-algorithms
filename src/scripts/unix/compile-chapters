#!/bin/bash
# source "$(dirname $0)/common"

cd src/chapters
find *.tex | xargs -n 1 -I{} arara -v {}

cd ../build

mkdir -p ./chapters
# find *.pdf | xargs -n 1 -I{} mv -v {} ./chapters
mv *.pdf ./chapters

cd ../..
