#!/bin/bash

# This script demonstrates a solution to the race condition bug.

count=0
lockfile="/tmp/counter.lock"

# Function to increment the counter using a lock file
increment_counter() {
  # Acquire lock
  flock -n $lockfile || { echo "Failed to acquire lock"; return 1; }

  local temp=$((count + 1))
  count=$temp

  # Release lock
  flock -u $lockfile
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