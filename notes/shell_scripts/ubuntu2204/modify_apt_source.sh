#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-23
#FileName:          modify_apt_source.sh
#URL:               http://github.com/lxwcd
#Description:       modify ubuntu apt source address
#Copyright (C):     2023 All rights reserved
#********************************************************************

# Function to handle jammy configuration
configure_jammy() {
    # Backup original sources.list
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

    # Configure mirror for jammy
    #MIRROR="mirrors.tuna.tsinghua.edu.cn"
    MIRROR="http://mirrors.aliyun.com/ubuntu/"
    sudo sed -i "s|http://.*archive.ubuntu.com|$MIRROR|g" /etc/apt/sources.list
    sudo sed -i "s|http://.*security.ubuntu.com|$MIRROR|g" /etc/apt/sources.list
}

# Function to handle noble configuration
configure_noble() {
    # Backup original ubuntu.sources
    sudo cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak

    # Configure mirror for noble (using Aliyun as example)
    #MIRROR="mirrors.tuna.tsinghua.edu.cn"
    MIRROR="https://mirrors.aliyun.com/ubuntu/"

    # Use sed to replace the URIs in the DEB822 format file
    sudo sed -i "s|http://cn.archive.ubuntu.com/ubuntu/|$MIRROR|g" /etc/apt/sources.list.d/ubuntu.sources
    sudo sed -i "s|http://security.ubuntu.com/ubuntu/|$MIRROR|g" /etc/apt/sources.list.d/ubuntu.sources

    # Optionally, you can also update to use HTTPS for all sources
    sudo sed -i 's|http://|https://|g' /etc/apt/sources.list.d/ubuntu.sources
}

# Function to handle unknown codename
configure_unknown() {
    echo "Warning: Unknown Ubuntu codename: $1"
}

# Get system version information
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    CODENAME=$DISTRIB_CODENAME
    RELEASE=$DISTRIB_RELEASE
else
    echo "Warning: Cannot detect system version." >&2
    CODENAME="unknown"
fi

# Execute configuration based on codename
case "$CODENAME" in
    "jammy")
        configure_jammy
        ;;
    "noble")
        configure_noble
        ;;
    *)
        configure_unknown "$CODENAME"
        ;;
esac

# Update package list (always do this)
echo "Updating package list..."
sudo apt update