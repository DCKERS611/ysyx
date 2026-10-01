#!/usr/bin/env bash


for file in "$@"; do
    grep -q foobar "$file"
    status=$?

    if [[ $status -eq 0 ]]; then
        echo "File $file already contains foobar"
    elif [[ $status -eq 1 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> "$file"
    else
        echo "Error: cannot search $file" >&2
        exit "$status"
    fi
done
