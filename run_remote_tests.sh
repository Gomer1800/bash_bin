#!/bin/bash

TESTS="$1"
OUTPUT="$2"
EXTENSION="$3"
REMOTE=~kmammen/357/Project1/mastermind

if [ $# -eq 0 ]
then
   echo "Missing args: <TEST_INPUT> <TEST_OUTPUT> <EXTENSION>"
else
   for _test in "$TESTS"/*
   do
      NAME="$_test"
      NAME=${NAME%.in}
      NAME=${NAME#"$TESTS"}
      "$REMOTE" < "$_test" > "$OUTPUT"/"$NAME""$3" 2>"$OUTPUT"/"$NAME".err
   done
fi
