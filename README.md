# Bash Race Condition Bug

This repository demonstrates a common race condition bug in bash scripting.  Two processes concurrently modify a shared variable without proper synchronization, leading to an incorrect final result.

## Bug Description
The `bug.sh` script attempts to increment a counter using two parallel processes.  Due to the lack of synchronization mechanisms, the increments may not be atomic, leading to lost updates and an incorrect final counter value.

## Solution
The `bugSolution.sh` script provides a corrected version using a lock file to ensure exclusive access to the counter variable, thereby preventing race conditions. 