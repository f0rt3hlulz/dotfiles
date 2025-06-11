#!/bin/sh

# set PATH so sketchybar can be found when run as LaunchAgent
PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:$PATH"

# use the $SELECTED var to toggle active/inactive state
if [ "${SELECTED:-0}" -eq 1 ]; then
  sketchybar --set "$NAME" icon="●"
else
  sketchybar --set "$NAME" icon="○"
fi
