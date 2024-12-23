#!/bin/bash

######### Download the default scripts

# XDG_CONFIG_HOME or $HOME/.config
conf_dir="${XDG_CONFIG_HOME:-$HOME/.config}/finderButtons"

# Check if conf_dir/finderButtons exists
if [ ! -d "$conf_dir" ]; then
    # create the directory
    mkdir -p "$conf_dir"

    # notification
    osascript -e 'display notification "Downloading default scripts..." with title "FinderButtons"'

    # Download the scripts from the GitHub
    curl -L https://github.com/oliviaBahr/finderButtonsScripts/archive/refs/heads/main.tar.gz | tar -xz -C "$conf_dir" --strip-components=1

    # notification
    osascript -e 'display notification "Scripts downloaded successfully." with title "FinderButtons"'
fi
