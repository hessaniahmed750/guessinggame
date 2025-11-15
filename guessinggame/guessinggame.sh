#!/bin/bash

function count_files {
    local count=$(ls -1 | wc -l)
    echo $count
}

file_count=$(count_files)

echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

while true; do
    read guess
    
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number:"
        continue
    fi
    
    if [ "$guess" -lt "$file_count" ]; then
        echo "Your guess is too low. Try again:"
    elif [ "$guess" -gt "$file_count" ]; then
        echo "Your guess is too high. Try again:"
    else
        echo "Congratulations! You guessed the correct number of files!"
        break
    fi
done

