#!/bin/sh
ssid=$(networksetup -getairportnetwork en0 2>/dev/null | sed 's/.*: //')
sketchybar --set "$NAME" label="$ssid"