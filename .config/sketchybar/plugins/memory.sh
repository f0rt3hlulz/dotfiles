#!/bin/sh
pagesize=$(sysctl -n hw.pagesize)
meminfo=$(vm_stat)
free_pages=$(echo "$meminfo" | awk '/Pages free/ {gsub("\\.","",$3); print $3}')
inactive_pages=$(echo "$meminfo" | awk '/Pages inactive/ {gsub("\\.","",$3); print $3}')
speculative_pages=$(echo "$meminfo" | awk '/Pages speculative/ {gsub("\\.","",$3); print $3}')
unused_pages=$((free_pages + inactive_pages + speculative_pages))
total_bytes=$(sysctl -n hw.memsize)
unused_bytes=$((unused_pages * pagesize))
used_bytes=$((total_bytes - unused_bytes))
used_mb=$((used_bytes / 1024 / 1024))
total_mb=$((total_bytes / 1024 / 1024))
sketchybar --set "$NAME" label="${used_mb}M/${total_mb}M"