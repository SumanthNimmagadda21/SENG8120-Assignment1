#!/bin/bash

source ./calculate_volume.sh

pass_count=0
fail_count=0

run_test() {
  description=$1
  expected=$2
  shift 2
  result=$(calculate_volume "$@" 2>/dev/null)

  if [ "$result" = "$expected" ]; then
    echo "[PASS] $description"
    ((pass_count++))
  else
    echo "[FAIL] $description - Expected: $expected, Got: $result"
    ((fail_count++))
  fi
}

echo "Running tests..."

run_test "Basic volume test 2x3x4" 24 2 3 4
run_test "Zero height test 0x3x4" 0 0 3 4
run_test "Zero width test 2x0x4" 0 2 0 4
run_test "Zero length test 2x3x0" 0 2 3 0
run_test "Negative height (invalid input)" "" -2 3 4
run_test "Non-integer input (e.g., 'a')" "" a 3 4
run_test "Missing argument (only two args)" "" 2 3

echo ""
echo "Tests passed: $pass_count"
echo "Tests failed: $fail_count"

if [ $fail_count -eq 0 ]; then
  exit 0
else
  exit 1
fi