#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          lvs_config.sh
#URL:               http://github.com/lxwcd
#Description:       config LVS
#Copyright (C):     2023 All rights reserved
#********************************************************************

echo -en "\E[$[RANDOM%7+31];1m"

cat <<EOF
select:
1) show ipvs module in kernel
2) check if the ipvs module has been loaded
3) show info about ipvs moduel
4) install ipvsadm
5) check the status of ipvsadm service


EOF

echo -en '\E[0m'

read -p "please input a number between 1 to 5: " menu

# check IPVS module in kernel
case $menu in
1) 
    grep -i -C 10 "ipvs" /boot/config-$(uname -r)
    ;;
2)
    line=$(lsmod | grep -i "ip_vs" | wc -l)
    if [ $line -lt 1 ]; then
        echo "ipvs moduled not loaded"
    else
        lsmod | grep -i "ip_vs"
    fi
    ;;
3)
    modinfo ip_vs
    ;;
4)
    if ! dpkg -V ipvsadm &> /dev/null; then
        apt update && apt install -y ipvsadm
    fi
    ;;
5)
    systemctl status ipvsadm.service
    ;;

*)
    echo "invalid input"
    ;;
esac




