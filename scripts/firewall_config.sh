#!/bin/bash

echo "Setting up firewalld rules..."

# Enable and start
systemctl enable firewalld
systemctl start firewalld

# Allow essential services
firewall-cmd --permanent --add-service=ssh
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https

# Remove insecure ports
firewall-cmd --permanent --remove-port=21/tcp
firewall-cmd --permanent --remove-port=23/tcp

# Reload firewall
firewall-cmd --reload

# Show status
echo "✅ firewalld status:"
firewall-cmd --list-all
