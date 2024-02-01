#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-02-01
#FileName:          set_proxy.sh
#URL:               http://github.com/lxwcd
#Description:       虚拟机配置主机代理 代理放在 /etc/profile.d/bash_custom.sh 中
#                   只对 interactive login shell 有效，即 echo $0 有 -
#Copyright (C):     2024 All rights reserved
#********************************************************************

proxy_file="/etc/profile.d/bash_proxy.sh"

answer=""

# 主机 ip 变化后更新
if [ -f "${proxy_file}" ]; then
    read -p "Do you want to update proxy? (y/n): " answer
else
    read -p "Do you want to configure a proxy? (y/n): " answer
fi

answer_lower=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "${answer_lower}" == "y" ]; then
    # 用户输入host IP
    read -p "Enter the host IP: " host_ip
    if ! [[ "$host_ip" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        echo "Invalid IP address."
        return
    fi

    # 用户输入proxy port
    read -p "Enter the proxy port: " proxy_port
    if ! [[ "$proxy_port" =~ ^[0-9]+$ ]]; then
        echo "Invalid port number."
        return
    fi

    # 将变量保存到文件中
    cat <<EOF > ${proxy_file}
export HOST_IP=$host_ip
export PROXY_PORT=$proxy_port

export HTTP_PROXY="http://$host_ip:$proxy_port"
export HTTPS_PROXY="http://$host_ip:$proxy_port"
export NO_PROXY="localhost,127.0.0.0/8,::1"
EOF

    . ${proxy_file}

    echo "Proxy configuration saved to ${proxy_file}"
fi
