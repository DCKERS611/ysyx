#!/usr/bin/env bash

count=0
log_file="output.txt"

:> "$log_file"

while ./random-error.sh >> "$log_file" 2>&1; do
    count=$((count+1))
done

count=$((count+1))

cat "$log_file"

echo "total times : $count"
