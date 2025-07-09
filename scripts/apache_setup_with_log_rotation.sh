#!/bin/bash

# Detect distro
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based system"
    sudo apt update && sudo apt install -y apache2
    LOG_DIR="/var/log/apache2"
    APACHE_SERVICE="apache2"
elif [ -f /etc/redhat-release ]; then
    echo "Detected RHEL-based system"
    sudo dnf install -y httpd
    LOG_DIR="/var/log/httpd"
    APACHE_SERVICE="httpd"
else
    echo "Unsupported distro"
    exit 1
fi

# Enable and start Apache
sudo systemctl enable "$APACHE_SERVICE"
sudo systemctl start "$APACHE_SERVICE"

# Create logrotate config
LOGROTATE_CONF="/etc/logrotate.d/apache_custom"

sudo tee "$LOGROTATE_CONF" > /dev/null <<EOF
$LOG_DIR/*.log {
    daily
    missingok
    rotate 7
    compress
    delaycompress
    notifempty
    create 640 root adm
    sharedscripts
    postrotate
        systemctl reload $APACHE_SERVICE > /dev/null
    endscript
}
EOF

echo "Apache setup complete with log rotation"
