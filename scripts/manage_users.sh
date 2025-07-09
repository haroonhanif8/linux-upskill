#!/bin/bash

USERLIST="../input/user_list.txt"
LOGFILE="../logs/users.log"
mkdir -p ../logs

echo "User Management Script Started at $(date)" >> "$LOGFILE"

while IFS=: read -r username groupname; do
    echo "Processing $username in group $groupname..."

    # Create group if it doesn't exist
    if ! getent group "$groupname" > /dev/null; then
        groupadd "$groupname"
        echo "Created group: $groupname" >> "$LOGFILE"
    fi

    # Create user if not exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists." >> "$LOGFILE"
    else
        useradd -m -g "$groupname" "$username"
        echo "$username:Password@123" | chpasswd
        passwd -e "$username"  # Force password change on first login
        echo "Created user: $username in group: $groupname" >> "$LOGFILE"
    fi

done < "$USERLIST"

echo "User Management Script Ended at $(date)" >> "$LOGFILE"
echo "✅ Done. Log saved to $LOGFILE"
