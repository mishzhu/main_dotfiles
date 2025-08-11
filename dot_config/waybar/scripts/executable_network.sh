#!/bin/bash

# Detect main network interface (same as ip.sh)
iface=$(ip route | awk '/default/ {print $5; exit}')

# Get RX and TX bytes from /sys/class/net interface counters
rx_prev_file="/tmp/${iface}_rx"
tx_prev_file="/tmp/${iface}_tx"

# Read previous values or initialize
if [ -f "$rx_prev_file" ]; then
  rx_prev=$(cat "$rx_prev_file")
else
  rx_prev=0
fi

if [ -f "$tx_prev_file" ]; then
  tx_prev=$(cat "$tx_prev_file")
else
  tx_prev=0
fi

# Read current bytes
rx_curr=$(cat /sys/class/net/"$iface"/statistics/rx_bytes)
tx_curr=$(cat /sys/class/net/"$iface"/statistics/tx_bytes)

# Calculate difference (bytes transferred since last check)
rx_diff=$((rx_curr - rx_prev))
tx_diff=$((tx_curr - tx_prev))

# Save current values for next run
echo "$rx_curr" > "$rx_prev_file"
echo "$tx_curr" > "$tx_prev_file"

# Convert bytes to KB/s or MB/s with human readable format
format_speed() {
  local bytes=$1
  local kib=$((1024))
  local mib=$((1024*1024))
  if (( bytes > mib )); then
    printf "%.1f MB/s" "$(echo "$bytes / $mib" | bc -l)"
  elif (( bytes > kib )); then
    printf "%.1f KB/s" "$(echo "$bytes / $kib" | bc -l)"
  else
    printf "%d B/s" "$bytes"
  fi
}

rx_speed=$(format_speed $rx_diff)
tx_speed=$(format_speed $tx_diff)

echo "↓ $rx_speed ↑ $tx_speed"
