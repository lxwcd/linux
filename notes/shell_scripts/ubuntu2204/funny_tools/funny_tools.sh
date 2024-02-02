#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-02-02
#FileName:          funny_tools.sh
#URL:               http://github.com/lxwcd
#Description:       安装好玩的工具
#Copyright (C):     2024 All rights reserved
#********************************************************************

function install() {
    if ! dpkg -l $1 &> /dev/null; then
        sudo apt install -y $1
    fi
}

function install_run() {
    if ! dpkg -l $1 &> /dev/null; then
        sudo apt install -y $1
        $1 # run
    fi
}

# fortune 终端随即显示笑话等
install_run fortune

# 彩色矩阵
install_run cmatrix

# ASCII 艺术生成器
install figlet

# ASCII 艺术生成器 另一种更艺术一点
install toilet

# train moving
install_run sl

