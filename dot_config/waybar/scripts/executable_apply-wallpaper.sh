#!/bin/bash

# Prompt user for wallpaper path
read -rp "Enter full path to wallpaper: " WALLPAPER

# Check if the file exists
if [[ ! -f "$WALLPAPER" ]]; then
    echo "=FAILED= File does not exist: $WALLPAPER"
    exit 1
fi

# Generate pywal color scheme
wal -i "$WALLPAPER"

# Path to original template style file with @colorX variables
STYLE_TEMPLATE="$HOME/.config/waybar/style_template.css"
STYLE_OUTPUT="$HOME/.config/waybar/style.css"

# Make sure template exists
if [[ ! -f "$STYLE_TEMPLATE" ]]; then
    echo "=FAILED= Template file not found: $STYLE_TEMPLATE"
    exit 1
fi

# Source the pywal colors
source "$HOME/.cache/wal/colors.sh"

# Replace @colorX, @base, etc., in the style_template.css with actual values
sed -e "s|@base|$background|g" \
    -e "s|@crust|$color0|g" \
    -e "s|@color0|$color0|g" \
    -e "s|@color1|$color1|g" \
    -e "s|@color2|$color2|g" \
    -e "s|@color3|$color3|g" \
    -e "s|@color4|$color4|g" \
    -e "s|@color5|$color5|g" \
    -e "s|@color6|$color6|g" \
    -e "s|@color7|$color7|g" \
    -e "s|@color8|$color8|g" \
    -e "s|@color9|$color9|g" \
    "$STYLE_TEMPLATE" > "$STYLE_OUTPUT"

# Restart Waybar
pkill waybar
waybar -c ~/.config/waybar/config.json -s ~/.config/waybar/style.css &

echo "=DONE= Wallpaper and Waybar style updated successfully."

