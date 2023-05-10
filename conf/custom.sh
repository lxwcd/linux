#!/bin/bash

# custom.sh

# set vi-style line editing interface
set -o vi


# format of history entries
export HISTTIMEFORMAT="[%F %T $(whoami)] "


# set PS1 命令提示符，加颜色
# \e[ 表示颜色开始，\e[0m 表示颜色结束 
# 颜色设置部分用 [] 包围，不然一行输入到头后新的行覆盖当前行的内容
# 36m 为青蓝色
PS1="\[\e[36m\][\u@\h \W]\$ \[\e[0m\]"

