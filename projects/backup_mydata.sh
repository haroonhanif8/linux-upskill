#!/bin/bash

# Variables
SRC_DIR="/home/haroonhanif/mydata"
DEST_DIR="/home/haroonhanif/backups"
DATE=$(date +%F)
BACKUP_NAME="mydata_backup_$DATE.tar.gz"

# Create backup destination if it doesn't exist
mkdir -p "$DEST_DIR"

# Run backup
tar -czf "$DEST_DIR/$BACKUP_NAME" "$SRC_DIR"

# Optional: keep only last 7 backups
find "$DEST_DIR" -name "mydata_backup_*.tar.gz" -mtime +7 -delete
