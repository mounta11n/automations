#!/bin/bash
set -e
set -x
cd "$(dirname "$0")"

# This script is supposed as a cron helper to run all scripts in the current directory

# First we define the destination of the log files
LOGS_DIR="$HOME/logs"
# In case the directory does not exist, we create it
mkdir -p "$LOGS_DIR"
# Then we define the name of the log file
LOG_FILE="$LOGS_DIR/$(date +"%Y-%m-%d_%H-%M-%S").log"
# Then we redirect the stdout and stderr to the log file
exec > "$LOG_FILE" 2>&1

# Then we run each *.sh file in the current directory one by one
for f in *.sh; do
  echo "Running $f"
  bash "$f"
  echo
done

# This is still work in progress.
# The idea is to be able to run all scripts in parallel
# For now we just run them sequentially
# Beside that we could implement some error handling or something like that
