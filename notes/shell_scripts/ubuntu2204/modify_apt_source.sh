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

source_old="cn.archive.ubuntu.com"
source_new="mirrors.tuna.tsinghua.edu.cn"
file_path="/etc/apt/sources.list"

line_old=$(sed -n "/${source_old}/p" ${file_path} | wc -l)
line_new=$(sed -n "/${source_new}/p" ${file_path} | wc -l)

if [ $line_new -lt 1 ]; then
    if [ $line_old -lt 1 ]; then
        echo "Failed to replace software source. Please replace the source manually."
    else
        sed -i.orig "s/${source_old}/${source_new}/g" ${file_path}
    fi
fi

unset source_old
unset source_new
unset file_path
unset line_old
unset line_new
