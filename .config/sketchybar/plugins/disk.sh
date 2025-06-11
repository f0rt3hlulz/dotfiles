#!/bin/sh

# set PATH so sketchybar and df/awk can be found when run as LaunchAgent
PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:$PATH"

# target root volume for disk usage (available/total)
target="/"

disk=$(df -h "$target" | awk 'END{print $4"/"$2}')
sketchybar --set "$NAME" label="$disk"
