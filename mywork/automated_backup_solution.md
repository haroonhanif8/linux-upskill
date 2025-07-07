# Automated Backup Solution

# What It Does

- Creates a compressed `.tar.gz` archive of `~/mydata`
- Saves it to `~/backups`
- Automatically deletes backups older than 7 days
- Scheduled via cron to run daily at 1 AM

---

# Script: `backup_mydata.sh`


#!/bin/bash

SRC_DIR="/home/haroonhanif/mydata"
DEST_DIR="/home/haroonhanif/backups"
DATE=$(date +%F)
BACKUP_NAME="mydata_backup_$DATE.tar.gz"

mkdir -p "$DEST_DIR"
tar -czf "$DEST_DIR/$BACKUP_NAME" "$SRC_DIR"
find "$DEST_DIR" -name "mydata_backup_*.tar.gz" -mtime +7 -delete

