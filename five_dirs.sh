#!/bin/bash

if [[ -d "five" ]]; then
   rm -rf five
fi

mkdir five
for i in {1..5}; do
    mkdir "five/dir$i"
    for j in {1..4}; do
	yes "$j" | head -n $j > "five/dir$i/files$j"
    done
done
