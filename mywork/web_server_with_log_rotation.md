# Simple Web Server with Secure Config + Log Rotation

# Objective

Deploy a basic Apache web server, apply hardening best practices, and verify log rotation for access logs.

---

# Installed Apache Web Server
sudo dnf install httpd -y
sudo systemctl enable --now httpd

---------------------------------

#Created Test Page
echo "Welcome to Haroon's Linux Server!" | sudo tee /var/www/html/index.html

#Access via:
curl http://localhost
________________________________________

#Hardened Apache Config
Edited: /etc/httpd/conf/httpd.conf

Apache
ServerTokens Prod
ServerSignature Off
Options -Indexes

#Restarted:
sudo systemctl restart httpd
________________________________________

#Verified Firewall Access
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --reload
________________________________________

#Verified Logging
Apache logs:
•	Access: /var/log/httpd/access_log
•	Error: /var/log/httpd/error_log

#Tested:
curl http://localhost
tail /var/log/httpd/access_log
________________________________________

#Verified Log Rotation
Apache uses /etc/logrotate.d/httpd
Forced test:
sudo logrotate -f /etc/logrotate.d/httpd
ls /var/log/httpd/

