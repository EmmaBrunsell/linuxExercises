#!/bin/bash

sum=0
regex="[^01]+"

for num in {1000..2000}; do if [[ "$num" =~ $regex ]]; then
				continue
			    fi
			    ((sum+=$num)) 
done

echo $sum
