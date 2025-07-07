#!/bin/bash

echo "===== Server Health Report ====="
echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo
echo "🔹 Disk Usage:"
df -h
echo
echo "🔹 Top 5 Memory-Hungry Processes:"
ps aux --sort=-%mem | head -n 6
echo
echo "🔹 System Uptime:"
uptime
