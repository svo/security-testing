#!/bin/bash

for i in */;
  do pushd $i;
  file=.gitignore
  if test -f "$file"; then
    pattern=`cat .gitignore`
    rm -rf $pattern
  fi
  popd;
done
