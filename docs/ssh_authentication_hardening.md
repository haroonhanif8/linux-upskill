# SSH Key Authentication & Hardening

# Objective

Configure secure SSH access using key-based authentication, disable password and root login, and verify both client and server identities.

---

# 1. Generated SSH Key Pair

Used the ED25519 algorithm (modern, fast, secure):

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

#2. Verified Key Fingerprints
Checked fingerprints of both private and public keys:
ssh-keygen -lf ~/.ssh/id_ed25519
ssh-keygen -lf ~/.ssh/id_ed25519.pub
#Fingerprints help verify identity without revealing keys.

#3. Checked Server Host Fingerprint
To ensure clients trust the server, checked its host key fingerprint:
sudo ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub
#This is what SSH clients see the first time they connect.

#4. Hardened SSH Server Configuration
Edited /etc/ssh/sshd_config to disable insecure options:
PermitRootLogin no
PasswordAuthentication no

Restarted SSH:
sudo systemctl restart sshd
# Now only key-based login is allowed, and root login is blocked.

#5. Tested SSH Authentication

✅ Successfully logged in using SSH key

❌ Password login attempts failed (as expected)

❌ Root login attempts denied (as expected)

Also used:
sudo sshd -T | grep -E "permitrootlogin|passwordauthentication"
#To confirm current settings.

# Script:

[ssh_hardening.sh](../scripts/ssh_hardening.sh)
