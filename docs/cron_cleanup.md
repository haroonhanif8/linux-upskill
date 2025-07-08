#  Cron Cleanup Script

# Objective
Create a cron job to automatically clean up files older than 7 days in `/tmp`.

---

# What I Did

- ✅ Created the script at `/etc/cron.daily/cleanup_tmp`
- ✅ Command used:
  find /tmp -type f -atime +7 -delete

# Made the script executable:
chmod +x /etc/cron.daily/cleanup_tmp

# Added log line to verify it runs:
echo "✅ Cleanup ran at \$(date)" >> /tmp/cron_test.log

# Tested manually using:
sudo /etc/cron.daily/cleanup_tmp

# Verified it runs via:
cat /tmp/cron_test.log
