#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          timezone_config.sh
#URL:               http://github.com/lxwcd
#Description:       set timezone
#Copyright (C):     2023 All rights reserved
#********************************************************************


# timedatectl set timezone
if timedatectl --version &> /dev/null; then
    timedatectl set-timezone Asia/Shanghai
else
    echo -e "6\n70" | apt update && apt install -y tzdata
fi
