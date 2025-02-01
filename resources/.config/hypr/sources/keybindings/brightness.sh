#!/usr/bin/env sh

# Accept an arg '+' or '-'
direction=$1

# Get monitor info
monitor_data=$(hyprctl monitors -j)
focused_name=$(echo $monitor_data | jq -r '.[] | select(.focused == true) | .name')

focused_id=$(echo $monitor_data | jq -r '.[] | select(.focused == true) | .id')
ddcutil --display=$((focused_id + 1)) setvcp 10 $direction 8
