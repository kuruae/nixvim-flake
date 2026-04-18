#!/usr/bin/env bash
max_lines=16

sprite="$(pokeget random --hide-name)"

line_count="$(printf '%s\n' "$sprite" | wc -l)"
if [ "$line_count" -gt "$max_lines" ]; then
  sprite="$(printf '%s\n' "$sprite" | tail -n "$max_lines")"
fi

clean="$(printf '%s\n' "$sprite" | sed 's/\x1b\[[0-9;]*m//g')"
width="$(printf '%s\n' "$clean" | awk '{ if (length > max) max = length } END { print max }')"
target=50
pad=$(( (target - width) / 2 ))
(( pad < 0 )) && pad=0
printf '%s\n' "$sprite" | while IFS= read -r line; do
  printf "%*s%s\n" "$pad" "" "$line"
done
