#!/usr/bin/env bash

sprite="$(pokeget random --hide-name)"

clean="$(printf '%s\n' "$sprite" | sed 's/\x1b\[[0-9;]*m//g')"

width="$(printf '%s\n' "$clean" | awk '{ if (length > max) max = length } END { print max }')"

target=50

pad=$(( (target - width) / 2 ))
(( pad < 0 )) && pad=0

printf '%s\n' "$sprite" | while IFS= read -r line; do
  printf "%*s%s\n" "$pad" "" "$line"
done
