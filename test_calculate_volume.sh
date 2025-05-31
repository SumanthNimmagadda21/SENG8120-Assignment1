#!/bin/bash

# test_calculate_volume.sh
# Unit tests for calculate_volume.sh

source ./calculate_volume.sh

pass_count=0
fail_count=0

run_test() {
  description=$1
  expected=$2
  shift 2
  result=$(calculate_volume "$@")

  if [ "$result" == "$expected" ]; then
    echo "[PASS] $description"
    pass_count=$((pass_count + 1))
  else
    echo "[FAIL] $description — Expected: $expected, Got: $result"
    fail_count=$((fail_count + 1))
  fi
}

# Happy path
run_test "Volume of 2x3x4" 24 2 3 4

# Edge case: zero
run_test "Volume with height = 0" 0 0 3 4

# Edge case: large numbers
run_test "Volume of 100x100x100" 1000000 100 100 100

# Invalid input: negative number
calculate_volume -2 3 4 > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "[PASS] Negative input correctly rejected"
  pass_count=$((pass_count + 1))
else
  echo "[FAIL] Negative input should be rejected"
  fail_count=$((fail_count + 1))
fi

# Invalid input: non-numeric
calculate_volume a b c > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "[PASS] Non-numeric input correctly rejected"
  pass_count=$((pass_count + 1))
else
  echo "[FAIL] Non-numeric input should be rejected"
  fail_count=$((fail_count + 1))
fi

# Summary
echo
echo "Total Passed: $pass_count"
echo "Total Failed: $fail_count"

if [ "$fail_count" -eq 0 ]; then
  exit 0
else
  exit 1
fi