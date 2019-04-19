#!/bin/bash

REMOTE="$1"
TESTS="$2"
OUTPUT="$3"
EXTENSION="$4"

if [ "$#" -lt 4 ]
then
   echo "Usage: <DIRECTORY/EXECUTABLE> <TEST_INPUT> <TEST_OUTPUT> <EXTENSION> <FLAG_1> ... <FLAG_N>"

else
   for _test in "$TESTS"/*
   do
      NAME="$_test"
      NAME=${NAME%.in}
      NAME=${NAME#"$TESTS"}
      if [ "$#" -eq 4 ]
      then
         ~kmammen/357/"$REMOTE" < "$_test" &> "$OUTPUT"/"$NAME""$3"
      else
         ~kmammen/357/"$REMOTE" "$FLAG" < "$_test" &> "$OUTPUT"/"$NAME""$3"
      fi
   done
fi
