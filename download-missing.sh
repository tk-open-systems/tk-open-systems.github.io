#!/bin/sh

URL=https://tkos.co.il

myget() {
  OUT=$1
  echo $OUT | grep -q '/$' && OUT=${OUT}index.html
  mkdir -p ${OUT%/*}
  wget --no-check-certificate -c -O $OUT $URL/$1
}

timeout 8 ./run-site.sh 2>&1 | grep -B1 "response:404" | grep url: \
  | cut -d/ -f2- \
  | while read a; do myget $a; done
