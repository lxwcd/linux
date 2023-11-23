#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-23
#FileName:          ubuntu2204_bug_fix.sh
#URL:               http://github.com/lxwcd
#Description:       fix ubuntu22.04 bug
#Copyright (C):     2023 All rights reserved
#********************************************************************


# uncomment three lines in /root/.bashrc
sed -i '/#if \[ -f \/etc\/bash_completion \] && ! shopt -oq posix; then/,+2 s/^#//' /root/.bashrc

# insert lines into /usr/share/bash-completion/bash_completion
file=$(cut /etc/bash_completion -d ' ' -f2)

line=$(sed -n '/COMPLETION_SOURCED="Y"/p' $file | wc -l)
if [ $line -lt 1 ]; then
    sed -i '1i\if [ -z "$COMPLETION_SOURCED" ]; then\n  COMPLETION_SOURCED="Y";\nelse\n  return\nfi\n' $file
    sed -i '1i\# Prevent doublesourcing' $file
fi

unset file
unset line

