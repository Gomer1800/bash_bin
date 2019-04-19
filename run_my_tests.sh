#!/bin/bash

TESTS="$1"
OUTPUT="$2"
EXTENSION="$3"

if [ "$#" -lt 3 ]
then
   echo "Usage: run_my_tests <TEST_INPUT> <TEST_OUTPUT> <EXTENSION> <FLAG_1> ... <FLAG_n>"
else
   for _test in "$TESTS"/*
   do
      NAME="$_test"
      NAME=${NAME%.in}
      NAME=${NAME#"$TESTS"}
      if [ "$#" -eq 3 ]
      then
         ./a.out < "$_test" &> "$OUTPUT"/"$NAME""$3"
      else
         ./a.out "${@:4}" < "$_test" &> "$OUTPUT"/"$NAME""$3"
      fi
   done
fi
