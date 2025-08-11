#!/bin/bash

current_brightness=$(brightnessctl g)
max_brightness=$(brightnessctl m)
percentage=$(( 100 * current_brightness / max_brightness ))

yad --scale \
    --title="Brightness" \
    --text="Set Brightness:" \
    --value="$percentage" \
    --min-value=0 \
    --max-value=100 \
    --step=1 \
    --width=300 \
    --height=100 \
    --undecorated \
    --skip-taskbar \
    --no-buttons \
    --on-top \
    --posx=1700 --posy=100 \
    --print-partial \
| while read -r new_brightness; do
    brightnessctl s "$new_brightness%"
done
