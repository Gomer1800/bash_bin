#!/bin/bash
NUM=1
FILE="$1"
PREFIX="input_"
TEST="${FILE#"input_"}"
FILENAME=myTests_"$TEST"

echo "$FILENAME"

while IFS= read -r line; do
   set --                                   # clear the argument list
   while IFS= read -r -d '' element; do     # read a NUL-delimited element
      set -- "$@" "$element"                # append to the argument list
   done < <(xargs printf '%s\0' <<<"$line") # write NUL-delimited elements

   echo "$NUM": "$@"
   ./a.out "$@" > "$FILENAME"_"$NUM"
   let "NUM++"

done <"$FILE"

cat "$FILENAME"_*
rm "$FILENAME"_*
