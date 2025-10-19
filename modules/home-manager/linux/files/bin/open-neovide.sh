#!/usr/bin/env bash

# Open Neovide in a specified directory

# Check if an argument was provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# The target directory is the first argument
TARGET_DIR=$1

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: '$TARGET_DIR' is not a directory."
  exit 2
fi

# Change to the target directory and launch Neovide
cd "$TARGET_DIR" && exec nvim
