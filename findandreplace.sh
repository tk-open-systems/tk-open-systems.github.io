#!/bin/sh
#
# From https://remarkablemark.org/blog/2020/07/12/git-grep-replace/

MATCH=$1
REPLACE=$2

git grep -l "$MATCH" \
  | while read f;
do
  echo $f
  sed -i -e "s|$MATCH|$REPLACE|g" "$f"
done
