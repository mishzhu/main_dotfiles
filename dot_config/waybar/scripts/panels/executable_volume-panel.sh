#!/bin/bash

current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%')

yad --scale \
    --title="Volume" \
    --text="Set Volume:" \
    --value="$current_volume" \
    --min-value=0 \
    --max-value=100 \
    --step=1 \
    --width=300 \
    --height=100 \
    --undecorated \
    --skip-taskbar \
    --no-buttons \
    --on-top \
    --posx=1700 --posy=40 \
    --print-partial \
| while read -r new_volume; do
    pactl set-sink-volume @DEFAULT_SINK@ "$new_volume%"
done
