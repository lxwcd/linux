#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-01-20
#FileName:          set_text_color.sh
#URL:               http://github.com/lxwcd
#Description:       shell set color function
#Copyright (C):     2024 All rights reserved
#********************************************************************


# 函数定义：设置文本属性
set_text_color() {
    local text="$1"
    local color="$2"
    local background="$3"
    local style="$4"
    local newline_option="${5:-newline}"

    # ANSI转义码
    local reset="\e[0m"
    local color_code=""
    local background_code=""
    local style_code=""

    # 根据输入设置颜色
    case "$color" in
        "black"|"k") color_code="30";;
        "red"|"r") color_code="31";;
        "green"|"g") color_code="32";;
        "yellow"|"y") color_code="33";;
        "blue"|"b") color_code="34";;
        "magenta"|"m") color_code="35";;
        "cyan"|"c") color_code="36";;
        "white"|"w") color_code="37";;
        *) color_code="";;
    esac

    # 根据输入设置背景
    case "$background" in
        "black"|"k") background_code="40";;
        "red"|"r") background_code="41";;
        "green"|"g") background_code="42";;
        "yellow"|"y") background_code="43";;
        "blue"|"b") background_code="44";;
        "magenta"|"m") background_code="45";;
        "cyan"|"c") background_code="46";;
        "white"|"w") background_code="47";;
        *) background_code="";;
    esac

    # 根据输入设置字体样式
    case "$style" in
        "bold") style_code="1";;
        "underline") style_code="4";;
        "blink") style_code="5";;
        *) style_code="";;
    esac

    # 输出带有属性的文本 默认换行
    if [ "$newline_option" == "newline" ]; then
        echo -e "\e[${style_code};${color_code};${background_code}m$text$reset"
    else
        echo -en "\e[${style_code};${color_code};${background_code}m$text$reset"
    fi
}

# 在脚本中调用函数
#text="Hello, Colored Text!"
#set_text_color "$text" "g" "k" "bold"
