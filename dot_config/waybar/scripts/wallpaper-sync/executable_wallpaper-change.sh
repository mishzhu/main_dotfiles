#!/bin/bash

WALLPAPER_PATH="$1"

# Set wallpaper with swww
swww img "$WALLPAPER_PATH" --transition-type any

# Generate colors with pywal (generates ~/.cache/wal/colors.css)
wal -i "$WALLPAPER_PATH"

# Reload waybar to apply new colors
pkill waybar
waybar &
