#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-01-20
#FileName:          judge_os.sh
#URL:               http://github.com/lxwcd
#Description:       判断操作系统
#Copyright (C):     2024 All rights reserved
#********************************************************************

. /etc/os-release


is_ubuntu() {
    # $ID 字符串转换为小写
    if [ "${ID,,}" = "ubuntu" ]; then 
        return 0
    else
        return 1
    fi
}


is_rocky_or_centos() {
    if [[ "${ID,,}" =~ centos|rocky ]]; then
        return 0
    else
        return 1
    fi
}
