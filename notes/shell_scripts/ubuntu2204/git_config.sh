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
name="lxwcd"
email="15521168075@163.com"

git config --global user.name "${name}"
git config --global user.email "${email}"

# config proxy
. set_proxy.sh
. /etc/profile.d/bash_proxy.sh

git config --global http.proxy http://${HOST_IP}:${PROXY_PORT}
git config --global https.proxy https://${HOST_IP}:${PROXY_PORT}

# add ssh key https://www.liaoxuefeng.com/wiki/896043488029600/896954117292416
# ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f ~/.ssh/id_rsa_custom
# 设置 SSH 密钥文件名
key_filename="${HOME}/.ssh/id_rsa"

# 检查是否存在 SSH 密钥文件
if [ -f "${key_filename}" ]; then
    echo "SSH key already exists: ${key_filename}"
else
    # 生成 SSH 密钥
    read -p "Do you want to generate a new pair of ssh key? (y/n): " answer
    answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

    if [ "${answer_lower}" == "y" ]; then
        ssh-keygen -t rsa -b 4096 -C "${email}"
        echo "SSH key generated and saved to: ${key_filename}"
    fi
fi

# delete tempory variable
unset name
unset email
unset host_ip
unset proxy_port
