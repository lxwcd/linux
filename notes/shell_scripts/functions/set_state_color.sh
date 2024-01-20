#!/bin/bash
#
# 设置带状态的颜色 如执行成功、失败 
# 可以调用 set_text_color 函数设置文字颜色

. set_text_color.sh


set_state_color () {
    local interval_col=60 # 文字和状态的间距

    # 第一部分文字 调用函数 set_text_color
    local text="$1" # 第一个参数 描述文字
    local text_color="default"
    local text_bg_color="default"
    local text_style="default"
    local text_newline="no newline"
    
    # 第二部分状态 
    local state="$2" # 第二个参数 状态
    local state_color="" # 状态颜色
    local state_text=""
    local state_style="1" # bold
    local reset="\e[0m"

    case "$state" in
        success|0) 
            state_color="32"
            state_text="OK"
            ;;
        failure|1) 
            state_color="31"
            state_text="FAILED"
            ;;
        *)         
            state_color="33"
            state_text="WARNING"
            ;;
    esac 

    set_text_color "${text}" "${text_color}" "${text_bg_color}" "${text_style}" "${text_newline}"
    echo -en "\e[${interval_col}G"
    echo -en "[\e[${state_style};${state_color}m${state_text}${reset}]"
    echo  
}

# 脚本中调用函数
#set_state_color "install sendmail" 0

