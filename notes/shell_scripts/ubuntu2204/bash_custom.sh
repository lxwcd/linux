#!/bin/bash

# set vi-style line editing interface
set -o vi


# set PS1 命令提示符，加颜色
# \e[ 表示颜色开始，\e[0m 表示颜色结束 
# 颜色设置部分用 [] 包围，不然一行输入到头后新的行覆盖当前行的内容
# 36m 为青蓝色
PS1="\[\e[36m\][\u@\h \W]\$ \[\e[0m\]"


# format of history entries
export HISTTIMEFORMAT="[%F %T $(whoami)] "


######################  alias  ###########################

alias rm='DIR=/tmp/rm_$(date +"%Y%m%d%H%M%S"); mkdir ${DIR}; mv -t ${DIR} '
alias rm_r='\rm -ri '
alias lsh='ls -A | grep -E "^[.].+$"'
alias ssh_noask="ssh -o StrictHostKeyChecking=no "
alias ssh_ask="ssh -o StrictHostKeyChecking=ask "
alias tree_v="tree -pughDFv "
alias ps_v="ps auxf | head -n1; ps auxf | grep -i "
