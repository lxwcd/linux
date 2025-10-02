#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2025-10-01
#FileName:          setup_vmware_tools.sh
#URL:               http://github.com/lxwcd
#Description:       install vmware tools
#Copyright (C):     2025 All rights reserved
#*******************************************************************

echo "=== Starting VMware Tools Installation ==="

# Step 1: Update package list
echo "Step 1/4: Updating package list..."
sudo apt-get update

# Step 2: Install VMware Tools
echo "Step 2/4: Installing VMware Tools..."
sudo apt-get install -y open-vm-tools open-vm-tools-desktop

# Step 3: Configure service
echo "Step 3/4: Configuring service..."
sudo systemctl enable open-vm-tools
sudo systemctl start open-vm-tools

# Step 4: Verify service status
echo "Step 4/4: Verifying service status..."
if systemctl is-active --quiet open-vm-tools; then
    echo "✓ open-vm-tools service is running"
else
    echo "✗ open-vm-tools service is not running, attempting to restart..."
    sudo systemctl restart open-vm-tools
fi

echo "=== VMware Tools installation completed ==="
echo "Recommendation: Reboot the system for copy-paste functionality"