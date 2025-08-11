#!/bin/bash

# Check if nvidia-smi is available
if ! command -v nvidia-smi &> /dev/null; then
    echo "N/A"
    exit 0
fi

# Extract GPU utilization percentage from nvidia-smi output
gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -n 1)

echo "$gpu_usage"
