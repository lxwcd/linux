#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-02-02
#FileName:          init.sh
#URL:               http://github.com/lxwcd
#Description:       ubuntu22.04 桌面版初始化配置
#Copyright (C):     2024 All rights reserved
#********************************************************************


# 设置分辨率 可能无效果
if ! dpkg -l open-vm-tools &> /dev/null; then
    sudo apt install -y open-vm-tools
fi

# 字体设置
if ! dpkg -l gnome-tweaks &> /dev/null; then
    sudo apt install gnome-tweaks -y
    gnome-tweaks
fi

# 中文输入法配置
if ! dpkg -l ibus-pinyin &> /dev/null; then
    sudo apt install ibus-pinyin -y
fi

