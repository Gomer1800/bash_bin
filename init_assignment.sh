#!/bin/bash
#
# -------------------------------------
# run this script by writing
# ./init_assignment.sh <arg1> <arg2>
# -------------------------------------
# Sudo code
# 1) Check if Directory $2 exists locally
# 2) Create directory $2
# 3) Scrape Makefile & requirements file from remote
# 4) Scrape Core & Feature tests using testList file
# -------------------------------------

TYPE="$1" # dollar sign-number denotes argument from command line, i.e. $1 is arg1
NUM="$2"
REMOTE=~kmammen-grader/evaluations/S19/357/"$TYPE""$NUM"
MAKE="$REMOTE"/Makefile
REQ="$REMOTE"/requirements
CORE="$REMOTE"/tests/core/
FEAT="$REMOTE"/tests/feature/

if [ -d "$NUM" ]; then # an expression within square brackets denotes a conditional check, this is equivalent to "test something"
# to find out how to use this, look up man test, -d checks if variable is a directory
   echo "$NUM" "Exists"
else
   echo "$USER" "Initializing" "$TYPE" "$NUM" "directory"
   mkdir "$NUM"
   # Scraping Makefile and requirements
   if [ -f "$MAKE" ]; then
      cp "$MAKE" ./"$NUM"/
   fi
   if [ -f "$REQ" ]; then
      cp "$REQ" ./"$NUM"/
   fi
   # Scraping CORE test descriptions
   if [ -f "$CORE"testList ]; then
      mkdir ./"$NUM"/core_tests
      while IFS= read -r line; do # while read line; do; done < inputfile, reads a file. Lookup man read to see more
         cp "$CORE"/"$line"/description ./"$NUM"/core_tests/"$line"
      done < "$CORE"testList
   fi
   # Scraping FEAT test descriptions
   if [ -f "$FEAT"testList ]; then
      mkdir ./"$NUM"/feat_tests
      while IFS= read -r line; do
         cp "$FEAT"/"$line"/description ./"$NUM"/feat_tests/"$line"
      done < "$FEAT"testList
   fi
fi   
