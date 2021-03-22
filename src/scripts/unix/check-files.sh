#!/bin/bash
source "${BASH_SOURCE%/*}/common.sh"

INITIAL_WORKING_DIRECTORY=$(pwd)

separator="=========================="
chapters_tex=$(ls -p $CHAPTERS_DIR | grep -v / | wc -l)

if [ -d "$BUILD_DIR/chapters" ]; then
  chapters_pdf=$(ls -A $BUILD_DIR/chapters | wc -l)
else
  chapters_pdf=0
fi

main_build=$BUILD_DIR/main.pdf

echo $separator
printf "%-20s %2s/%s\n" "no. of chs. built" "$chapters_pdf" "$chapters_tex"

echo $separator
if [ -f "$main_build" ]; then
  printf "%23s %s\n" "main" "✔️"
else
  printf "%23s %s\n" "main" "❌"
fi

echo $separator
# creo una lista dei file nella cartella dei capitoli sorgente
filename="$SCRIPTS_DIR/temp.txt"
ls -p $CHAPTERS_DIR | grep -v / > "${filename}"
# rimuovo le estensioni
sed -i -e 's/\(.tex\)*$//g' ${filename}

# leggo il file
while read -r file; do
  check_file="$BUILD_DIR/chapters/$file.pdf"
  if [[ -e "$check_file" ]]; then
    printf "%23s %s\n" "$file" "✔️"
  else
    printf "%23s %s\n" "$file" "❌"
  fi
done < "$filename"
echo $separator

# lo elimino
rm $filename

isCompilationRanCorrectly() {
  if [ $chapters_pdf -eq $chapters_tex ] && [ -f $main ]; then
      exit 0 # success
  else
      exit 1 # failure
  fi
}

cd $INITIAL_WORKING_DIRECTORY