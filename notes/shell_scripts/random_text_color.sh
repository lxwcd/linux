#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          random_text_color.sh
#URL:               http://github.com/lxwcd
#Description:       set random text color in terminal
#Copyright (C):     2023 All rights reserved
#********************************************************************

# Generate random text color code between 31 and 37
color_code=$((RANDOM % 7 + 31))

# Set terminal text color and bold attribute
# \E: 这是转义字符，用于表示后续的字符是一个控制序列
# color_code 范围 31 ~ 37 确定文字颜色代码
# 1m 是控制序列的一部分，用于设置文本的显示属性。这里的 1 表示粗体（bold）文本
echo -en "\E[${color_code};1m"


# Reset terminal text color and attributes
#echo -e "\E[0m"


