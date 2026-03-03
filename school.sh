#!/bin/bash

cat Property_Tax_Roll.csv \
| grep "MADISON SCHOOLS" \
| cut -d',' -f7 \
| {
    sum=0
    count=0
    while read -r value; do
        sum=$((sum + value))
        count=$((count + 1))
    done

    echo "Sum: $sum"
    if [ "$count" -gt 0 ]; then
      echo "Average: $((sum / count))"
    else
      echo "Average: N/A (no matching rows)"
    fi
  }
