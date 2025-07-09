#!/bin/bash

# Cleanup old logs and temp files
LOG_DIR="/var/log"
TMP_DIR="/tmp"

echo "Cleaning logs older than 7 days..."
find "$LOG_DIR" -type f -mtime +7 -exec rm -f {} \;

echo "Cleaning temp files older than 3 days..."
find "$TMP_DIR" -type f -mtime +3 -exec rm -f {} \;

echo "Cleanup done at $(date)"
