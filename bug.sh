#!/bin/bash

# This script demonstrates a race condition bug.

count=0

# Function to increment the counter
increment_counter() {
  local temp=$((count + 1))
  count=$temp
}

# Function to print the counter
print_counter() {
  echo "Counter: $count"
}

# Create two parallel processes to increment the counter
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final counter value
print_counter