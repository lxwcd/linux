#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-02-01
#FileName:          init.sh
#URL:               http://github.com/lxwcd
#Description:       ubuntu22.04 初始化脚本
#Copyright (C):     2024 All rights reserved
#********************************************************************

# 配置代理
. set_proxy.sh

# ubuntu22.04 bug 修复
. ubuntu2204_bug_fix.sh

# 拷贝自定义脚本 
. create_custom_script.sh

# 修改仓库源
. modify_apt_source.sh

# 修改语言环境
. lang_config.sh

# 修改时区
. timezone_config.sh

# 配置 git 
. git_config.sh

# 配置 vim
. vim_config.sh

# 配置 ssh
. ssh_config.sh
