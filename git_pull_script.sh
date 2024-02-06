#!/bin/bash

# Check if the root directory argument is provided
if [ -z "$1" ]; then
    echo "Please provide the root directory path."
    exit 1
fi

root_dir="$1"

# Check if the specified directory exists
if [ ! -d "$root_dir" ]; then
    echo "Directory '$root_dir' does not exist."
    exit 1
fi

# Go through each directory in the specified path
for dir in "$root_dir"/*/; do
    if [ -d "$dir/.git" ]; then
        echo "Processing $dir"
        cd "$dir" || exit

        # Check if 'main' branch exists, otherwise, try 'master'
        if git show-ref --verify --quiet refs/heads/main; then
            git checkout main
        elif git show-ref --verify --quiet refs/heads/master; then
            git checkout master
        elif git show-ref --verify --quiet refs/heads/green; then
            git checkout green
        else
            echo "Neither 'main' nor 'master' nor 'green' branch found in $dir"
            cd "$root_dir"
            continue
        fi

        # Pull changes using rebase
        git pull --rebase --autostash
        cd "$root_dir"
    fi
done
