# Server Health Checker Script

# What It Does

This script reports on key system health stats:
- Hostname
- Date/time
- Disk usage
- Top 5 memory-using processes
- System uptime

---

## Script: `server_health_check.sh`

#!/bin/bash

echo "===== Server Health Report ====="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo
echo " Disk Usage:"
df -h
echo
echo " Top 5 Memory-Hungry Processes:"
ps aux --sort=-%mem | head -n 6
echo
echo " System Uptime:"
uptime
