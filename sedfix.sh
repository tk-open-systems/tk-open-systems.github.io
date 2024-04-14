#!/bin/sh

find . -type f -name '*.html' | xargs dos2unix

{
find . -maxdepth 5 -type f -name '*.html'
} | while read i
do
  printf "Fixing $i..."
  dos2unix "$i" >/dev/null 2>&1
  sed -i \
    -e 's|https://tkos.co.il/|/|g' \
    -e 's|http://tkos.co.il/|/|g' \
    -e 's|https://tkos.co.il||g' \
    -e 's|"concatemoji":"https:\\/\\/tkos.co.il|"concatemoji":"|' \
    "$i" && echo OK
done
