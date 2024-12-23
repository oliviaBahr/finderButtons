#!/bin/bash

# XDG_CONFIG_HOME or $HOME/.config
conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

# Find all files named "ide" in conf_dir/finderButtons
ide_file=$(find "$conf_dir/finderButtons" -type f -name "ide.*")

# Check if more than one file was found
if [ $(echo $ide_file | wc -l) -gt 1 ]; then
    osascript -e 'display notification "Only one 'ide' script allowed. Multiple found." with title "Error"'
    exit 1
fi

# Run the script
if [[ $ide_file == *.applescript ]]; then
    osascript $ide_file
elif [[ $ide_file == *.sh ]]; then
    bash $ide_file
else
    echo "Unsupported file type: ${ide_file##*.}"
fi
