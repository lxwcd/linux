#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          git_config.sh
#URL:               http://github.com/lxwcd
#Description:       install and config git 
#Copyright (C):     2023 All rights reserved
#********************************************************************

# install git
if ! dpkg -V git; then
	apt update && apt install -y git
fi

# config git
name="lx"
email="15521168075@163.com"

git config --global user.name "${name}"
git config --global user.email "${email}"

# config proxy
host_ip="192.168.0.119"
proxy_port="7890"

git config --global http.proxy http://${host_ip}:${proxy_port}
git config --global https.proxy https://${host_ip}:${proxy_port}


# delete tempory variable
unset name
unset email
unset host_ip
unset proxy_port
