#!/bin/bash

# XDG_CONFIG_HOME or $HOME/.config
conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

# Find all files named "terminal" in conf_dir/finderButtons
term_file=$(find "$conf_dir/finderButtons" -type f -name "terminal.*")

# Check if more than one file was found
if [ $(echo "$term_file" | wc -l) -gt 1 ]; then
    osascript -e 'display notification "Only one 'terminal' script allowed. Multiple found." with title "Error"'
    exit 1
fi

# Run the script
if [[ $term_file == *.applescript ]]; then
    osascript $term_file
elif [[ $term_file == *.sh ]]; then
    bash $term_file
else
    echo "Unsupported file type: ${term_file##*.}"
fi
