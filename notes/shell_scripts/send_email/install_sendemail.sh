#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2024-01-20
#FileName:          install_sendmail.sh
#URL:               http://github.com/lxwcd
#Description:       shell script
#Copyright (C):     2024 All rights reserved
#********************************************************************



. ../functions/judge_os.sh


if is_ubuntu; then
   dpkg -l |grep -q sendemail  || { apt update; apt install -y libio-socket-ssl-perl libnet-ssleay-perl sendemail ; } 
elif is_rocky_or_centos; then
   rpm -q sendemail &> /dev/null ||  yum install -y sendemail
else
    . functions/set_state_color.sh
    set_state_color "不支持此操作系统，请手动安装!" 1
fi

