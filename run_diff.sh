#!/bin/bash

OUT="$1"
REF="$2"

if [ $# -eq 0 ]
then
   echo "Missing args: <OUT_DIR> <REF_DIR>"
else
   for _test in "$OUT"/*
   do
      NAME="$_test"
      NAME=${NAME%.out}
      NAME=${NAME#"$OUT/"}
      diff -q "$_test" "$REF"/"$NAME".ref
      if [ $? == 0 ]; then
          echo "$NAME" "tests passed"
      else
          echo "$NAME" "tests failed"
      fi
   done
fi
