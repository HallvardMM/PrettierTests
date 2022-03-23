#!/bin/bash
# Check to see if a pipe exists on stdin.
sum = 0
if [ -p /dev/stdin ]; then
        # If we want to read the input line by line
        while IFS= read line; do
                id=$(echo "${line}" | grep -o -E '[0-9]+'| tail -1)
                sum=$((sum + id))
        done
        echo "Time used by Prettier: ${sum}ms"
        # Or if we want to simply grab all the data, we can simply use cat instead
        # cat
else
        echo "No input was found on stdin, skipping!"
fi