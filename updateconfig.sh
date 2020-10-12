#!/usr/bin/bash

# 将在内存文件中的个人配置备份到U盘
# 1、拷贝用户目录的.ssh 文件夹、bash*、zsh*文件到 /boot 
# 2、重新压缩 oh-my-zsh
# 3、拷贝/boot/config/custom.scripts 目录到 /mnt/user/tmp 下

cd /root
cp -u /root/.ssh/* /boot/config/custom.scripts/.ssh/
cp -u /root/bash* /boot/config/custom.scripts/
cp -u /root/zsh* /boot/config/custom.scripts/

tar -zcvf oh-my-zsh.tar.gz .oh-my-zsh
cp oh-my-zsh.tar.gz /boot/config/custom.scripts/
