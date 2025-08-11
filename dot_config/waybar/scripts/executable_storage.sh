#!/bin/bash

# Get the device where root (/) is mounted
root_device=$(findmnt / -o SOURCE -n)

# Remove partition number to get the disk (e.g., /dev/sda1 → /dev/sda)
disk_device=$(echo "$root_device" | sed 's/[0-9]*$//')

# Check if the disk is rotational (1 = HDD, 0 = SSD)
rotational=$(cat /sys/block/$(basename $disk_device)/queue/rotational 2>/dev/null)

# Get available space on the root partition in GB (rounded)
free_gb=$(df -BG / | tail -1 | awk '{print $4}' | sed 's/G//')

if [[ $rotational == "0" ]]; then
    echo "SSD: ${free_gb}GB"
elif [[ $rotational == "1" ]]; then
    echo "HDD: ${free_gb}GB"
else
    echo "${free_gb}GB"
fi

