# firewalld Setup & Automation

This project configures basic firewall rules using firewalld.

---

# What it does

- Enables and starts firewalld
- Allows SSH, HTTP, HTTPS
- Removes insecure ports (FTP, Telnet)
- Persists rules after reboot
- Shows active rules

---

# Script: `scripts/firewall_config.sh`

#!/bin/bash
# Full script here...
