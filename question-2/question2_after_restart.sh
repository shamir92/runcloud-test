#!/bin/bash

# Update the mount options for the filesystem
sudo sed -i '/^LABEL=cloudimg-rootfs/ s/discard/usrquota,grpquota,discard/' /etc/fstab

sudo systemctl daemon-reload
# Remount the filesystem
sudo mount -o remount /

# Verify that the new options are used to mount the filesystem
cat /proc/mounts | grep ' / '

# Initialize quotas
sudo quotacheck -ugm /

# Enable quotas
sudo quotaon -v /