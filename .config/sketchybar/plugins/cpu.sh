#!/bin/sh
usage=$(top -l 1 | awk -F'[:,]' '/CPU usage/ {user=$2; sys=$3; gsub(/[% ]/,"",user); gsub(/[% ]/,"",sys); printf("%.0f", user+sys)}')
sketchybar --set "$NAME" label="${usage}%"