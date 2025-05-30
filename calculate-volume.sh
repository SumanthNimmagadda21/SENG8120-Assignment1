#!/bin/bash

# calculate_volume.sh
# Function to calculate the volume of a rectangular prism

calculate_volume() {
  local height=$1
  local width=$2
  local length=$3

  # Validate that inputs are integers and positive
  if ! [[ "$height" =~ ^[0-9]+$ && "$width" =~ ^[0-9]+$ && "$length" =~ ^[0-9]+$ ]]; then
    echo "Error: All inputs must be positive integers." >&2
    return 1
  fi

  echo $((height * width * length))
}