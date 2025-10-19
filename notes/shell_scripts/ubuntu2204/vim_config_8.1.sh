#!/bin/bash
#
#********************************************************************
#Author:            lx
#Date:              2023-11-22
#FileName:          vim_config.sh
#URL:               http://github.com/lxwcd
#Description:       config vim 8.1, use root
#Copyright (C):     2023 All rights reserved
#********************************************************************


# vim 8.1

#vimrc_link="https://github.com/lxwcd/learnVim.git"
vimrc_link="https://gitee.com/cd-00/learnVim.git"
vim_version=$(vim --version | head -n 1 | awk '{print $5}')

if [ "${vim_version}" != "8.1" ]; then
	echo "please config vimrc manually according to ${vimrc_link}"
	return
fi

# download vimrc.local from gitee
if [ ! -f /etc/vim/vimrc.local ]; then
	sudo git clone ${vimrc_link} /usr/local/src/vim_config
	cp /usr/local/src/vim_config/vimrc.local /etc/vim/
fi

# prohibt from using default defaults.vim 
default_vimrc="/usr/share/vim/vim81/defaults.vim"
skip_default="let g:skip_defaults_vim = 1"
line=$(sed -n "/^${skip_default}/p" ${default_vimrc} | wc -l)

if [ -f ${default_vimrc} ]; then
	if [ $line -lt 1 ]; then 
		sed -i '1a\let g:skip_defaults_vim = 1' ${default_vimrc}
	fi
fi

# apply vimrc.local
vim --cmd "source /etc/vim/vimrc.local" --cmd "q"

# install vim-gtk to access the system clipboard
apt update && apt install -y vim-gtk3
#if ! dpkg -V vim-gtk; then
	#apt update && apt install -y vim-gtk
#fi

# unset variable
unset vimrc_link
unset vim_version
unset default_vimrc
unset skip_default
unset line

