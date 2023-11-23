#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          lang_config.sh
#URL:               http://github.com/lxwcd
#Description:       set lang
#Copyright (C):     2023 All rights reserved
#********************************************************************

lang=$(echo $LANG)
if [ $lang = "en_US.UTF-8" ]; then
    unset lang
    return
fi

line=$(localectl list-locales | sed -n '/en_US.UTF-8/p'| wc -l)

if [ $line -gt 0 ]; then
    localectl set-locale LANG=en_US.UTF-8
    echo "set lang to en_US.UTF-8, reboot to apply it"
else
    echo "please modify lang manually"
fi

unset lang
unset line
