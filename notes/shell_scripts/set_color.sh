#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-12-01
#FileName:          set_color.sh
#URL:               http://github.com/lxwcd
#Description:       get_opts 函数设置字体颜色 背景颜色 字体属性
############        需要为脚本添加可执行权限，用 ./set_color 方式，不能用 . set_color
#Copyright (C):     2023 All rights reserved
#********************************************************************

set -e
set -u
#set -x

### **************** 获取选项和参数 字体颜色 字体属性 背景颜色 ******************* ###
function showHelp() {
    echo "Options:"
    echo "-c set font color"
    echo "-a set font attributes (e.g., bold, italic)"
    echo "-b set background color"
    echo "-h show help"
    echo ""
    echo "Available font colors:"
    echo "black, red, green, yellow, blue, magenta, cyan, white, random"
    echo ""
    echo "Available font attributes:"
    echo "bold, dim, italic, underline, blink"
    echo ""
    echo "Avaiable background colors:"
    echo "black, red, green, yellow, blue, magenta, cyan, white, random"
    echo ""
    echo "Example usage:"
    echo "./set_color.sh -c red -b green -a bold,underline "Hello, world!""
}

text=""
color=""
attributes=""
background=""

while getopts ":c:a:b:h" opt; do
    case $opt in
        c)
            color="$OPTARG"
            ;;
        a)
            attributes="$OPTARG"
            ;;
        b)
            background="$OPTARG"
            ;;
        h)
            showHelp
            exit 0
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done


### ********* 获取需要设置颜色的文本内容 默认放在最后，无则终端的全部颜色 ********** ###
# get text content
shift $((OPTIND - 1))
text="$1"

# If no text is specified, set it to receive all subsequent input text.
if [ -z "$text" ]; then
    reset_code=""
fi


### ***************** 设置字体属性 可以多个 逗号分割 ************************ ###
attribute_code=""
reset_code="\e[0m"

if [ -n "$attributes" ]; then
    IFS=',' read -ra attr_list <<< "$attributes"
    for attr in "${attr_list[@]}"; do
        case $attr in
            bold)
                attribute_code+="\e[1m"
                ;;
            dim)
                attribute_code+="\e[2m"
                ;;
            italic)
                attribute_code+="\e[3m"
                ;;
            underline)
                attribute_code+="\e[4m"
                ;;
            blink)
                attribute_code+="\e[5m"
                ;;
            *)
                echo "Invalid attribute: $attr" >&2
                exit 1
                ;;
        esac
    done
fi

### ************************** 设置字体颜色 **************************** ###
color_code=""
background_code=""

if [ -n "$color" ]; then
    case $color in
        black)
            color_code="\e[30m"
            ;;
        red)
            color_code="\e[31m"
            ;;
        green)
            color_code="\e[32m"
            ;;
        yellow)
            color_code="\e[33m"
            ;;
        blue)
            color_code="\e[34m"
            ;;
        magenta)
            color_code="\e[35m"
            ;;
        cyan)
            color_code="\e[36m"
            ;;
        white)
            color_code="\e[37m"
            ;;
        random)
            color_num=$((RANDOM % 8 + 30))
            color_code="\e[${color_num}m"
            ;;
        *)
            echo "Invalid font color: $color" >&2
            exit 1
            ;;
    esac
fi

### ************************* 设置背景颜色 **************************** ###
if [ -n "$background" ]; then
    case $background in
        black)
            background_code="\e[40m"
            ;;
        red)
            background_code="\e[41m"
            ;;
        green)
            background_code="\e[42m"
            ;;
        yellow)
            background_code="\e[43m"
            ;;
        blue)
            background_code="\e[44m"
            ;;
        magenta)
            background_code="\e[45m"
            ;;
        cyan)
            background_code="\e[46m"
            ;;
        white)
            background_code="\e[47m"
            ;;
        random)
            color_num=$((RANDOM % 8 + 40))
            color_code="\e[${color_num}m"
            ;;
        *)
            echo "Invalid background color: $background" >&2
            exit 1
            ;;
    esac
fi


echo -e "${attribute_code}${background_code}${color_code}${text}${reset_code}"
