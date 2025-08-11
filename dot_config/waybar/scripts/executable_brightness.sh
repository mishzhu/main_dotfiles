#!/usr/bin/env bash

# Get current brightness percentage (assuming first backlight device)
brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)
brightness_percent=$(( brightness * 100 / max_brightness ))

# Number of blocks in the bar
max_blocks=10
filled_blocks=$(( brightness_percent * max_blocks / 100 ))
empty_blocks=$(( max_blocks - filled_blocks ))

# Build ASCII bar
filled_char="█"
empty_char=" "
bar=$(printf "%0.s$filled_char" $(seq 1 $filled_blocks))
bar+=$(printf "%0.s$empty_char" $(seq 1 $empty_blocks))

# Output bar with percentage
echo "$bar $brightness_percent%"
