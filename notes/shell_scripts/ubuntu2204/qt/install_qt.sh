#!/bin/bash
#
#********************************************************************
#Date:              2024-02-02
#FileName:          install_qt.sh
#安装教程:               https://blog.csdn.net/qq_50832904/article/details/121724896
#Description:       安装 qt5，qt 工程给 rxw 权限
#********************************************************************

if ! dpkg -l qtcreator &> /dev/null; then
    sudo apt install -y build-essential
    apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
    apt install -y creator qt5*
    apt install -y libfontconfig1
    apt install -y libglu1-mesa-dev 
    apt install -y libclang-common-15-dev
fi


