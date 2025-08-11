#!/usr/bin/env bash

# Get current volume percentage from default sink
vol_percent=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

# Number of blocks in the bar
max_blocks=10
filled_blocks=$(( vol_percent * max_blocks / 100 ))
empty_blocks=$(( max_blocks - filled_blocks ))

# Build ASCII bar
filled_char="█"
empty_char=" "
bar=$(printf "%0.s$filled_char" $(seq 1 $filled_blocks))
bar+=$(printf "%0.s$empty_char" $(seq 1 $empty_blocks))

# Output bar with percentage
echo "$bar $vol_percent%"

