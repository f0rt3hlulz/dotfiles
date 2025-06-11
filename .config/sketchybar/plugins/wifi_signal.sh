#!/bin/sh

# set PATH so required binaries are found when run as LaunchAgent
PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:$PATH"

# gather Wi-Fi info
airport_bin="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
wifi_info=$("$airport_bin" -I 2>/dev/null)

# parse SSID; hide widget when not associated
ssid=$(echo "$wifi_info" | awk -F': ' '/^[[:space:]]*SSID: / {print $2}')
if [ -z "$ssid" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# show icon when connected
sketchybar --set "$NAME" drawing=on
