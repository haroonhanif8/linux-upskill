#!/bin/bash

SSHD_CONFIG="/etc/ssh/sshd_config"

echo "Backing up SSH config..."
cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak.$(date +%F-%T)"

echo "Disabling root login and password auth..."
sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' "$SSHD_CONFIG"
sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' "$SSHD_CONFIG"

echo "Restarting SSH service..."
systemctl restart sshd

echo "SSH hardening applied"
