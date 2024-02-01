#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-02-01
#FileName:          create_custom_script.sh
#URL:               http://github.com/lxwcd
#Description:       创建自定义脚本 为了让 interactive login 和 non-login 用户都生效，放在 ~/bash_custom
#                   在 ~/.bashrc 中添加对 ~/bash_custom.sh 的调用
# Copyright (C):     2024 All rights reserved
#********************************************************************

custom_script="bash_custom.sh"
skel_script="/etc/skel/${custom_script}"

# 检查skel_script文件是否存在 存在则覆盖，可以用于更新脚本
# [ -f "${skel_script}" ] && return

# ~/.bashrc 添加自定义脚本的调用
modify_bashrc () {
    if grep -q "${custom_script}" "$1"; then 
        return; 
    fi

    cat <<EOF >> $1
if [ -f ~/bash_custom.sh ]; then
    . ~/bash_custom.sh
fi
EOF
}

# 修改 /etc/skel/.bashrc
modify_bashrc "/etc/skel/.bashrc"

sudo cp ${custom_script} /etc/skel/

# 拷贝到已有的用户家目录 
for user_home in /home/*; do
    if [ -d "${user_home}" ]; then
        user_script="${user_home}/${custom_script}"

        modify_bashrc "${user_home}/.bashrc"
        # 检查用户目录中是否已存在bash_custom.sh文件
        if [ ! -f "${user_script}" ]; then
            # 文件不存在，执行拷贝和设置所有者的操作
            cp "${skel_script}" "${user_script}"
            chown $(basename ${user_home}):$(basename ${user_home}) "${user_script}"
            echo "bash_custom.sh copied to $user_home"
        fi
    fi
done


# 拷贝到 root 家目录
modify_bashrc "/root/.bashrc"
if [ ! -f "/root/${custom_script}" ]; then
    cp ${custom_script} /root/${custom_script}
fi

# 让当前用户配置生效
. ~/${custom_script}
