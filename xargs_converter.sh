#!/bin/bash
file="$1"
while IFS= read -r line; do
   set --                                   # clear the argument list
   while IFS= read -r -d '' element; do     # read a NUL-delimited element
      set -- "$@" "$element"                # append to the argument list
   done < <(xargs printf '%s\0' <<<"$line") # write NUL-delimited elements

   echo "$@"

done <"$file"
