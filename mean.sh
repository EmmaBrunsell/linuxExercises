#!/bin/bash
if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
fi

col="$1"

file="/dev/stdin"
if [[ $# -eq 2 ]]; then
  file="$2"
fi

cut -d',' -f"$col" "$file" \
| tail -n +2 \
| {
    sum=0
    count=0
    while read -r x; do
      [[ -z "$x" ]] && continue
      sum=$(echo "$sum + $x" | bc)
      count=$((count + 1))
    done

    if [[ $count -eq 0 ]]; then
      echo "Error: no data in column $col" 1>&2
      exit 1
    fi

    echo "scale=6; $sum / $count" | bc
  }
