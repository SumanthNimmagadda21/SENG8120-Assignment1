#!/bin/bash

calculate_volume() {
  height=$1
  width=$2
  length=$3

  # Input validation
  if ! [[ "$height" =~ ^[0-9]+$ ]] || ! [[ "$width" =~ ^[0-9]+$ ]] || ! [[ "$length" =~ ^[0-9]+$ ]]; then
    echo "Error: All inputs must be positive integers." >&2
    return 1
  fi

  echo $((height * width * length))
}

# If script is run directly (not sourced), call function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  if [ $# -ne 3 ]; then
    echo "Usage: $0 HEIGHT WIDTH LENGTH" >&2
    exit 1
  fi

  calculate_volume "$1" "$2" "$3"
fi