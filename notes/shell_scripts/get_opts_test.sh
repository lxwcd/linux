#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-12-02
#FileName:          test.sh
#URL:               http://github.com/lxwcd
#Description:       get_opts test script
#Copyright (C):     2023 All rights reserved
#********************************************************************


while getopts ":a:b:c" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG, index: $OPTIND" 
      ;;
    b)
      echo "-b was triggered, Parameter: $OPTARG, index: $OPTIND" 
      ;;
    c)
      echo "-c was triggered, index: $OPTIND" 
      ;;
    \?)
      echo "Invalid option: -$OPTARG" 
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." 
      exit 1
      ;;
  esac
done

echo index: $OPTIND
shift $(( $OPTIND-1 ))
echo the number of remaining params: $#, $@

for i in $*; do
    echo param $i
done


# 将命令行参数保存到数组中 不包括脚本名称
# 使用括号将 $@ 包裹起来，以确保每个参数作为数组中的一个元素。
# 同时，使用引号将其括起来，可以保留参数中的空格和特殊字符
# 如 ./test.sh -a about -b "buy now" -c "hello world" foo bar baz
# 需要将 buy now 作为数组的一个元素，则用引号括起来
all_args=("$@")  
    


# 将脚本名称添加到数组中
args=("$0")  

# 将命令行参数添加到数组中
for arg in "$@"; do
  args+=("$arg")
done

# 显示参数的位置和值
for ((i=0; i<${#args[@]}; i++)); do
  echo "第 $i 个参数：${args[$i]}"
done
