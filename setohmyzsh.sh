#!/bin/bash

if [ ! -d /root/.oh-my-zsh  ] ; then
    # 压缩 
    # tar -zcvf oh-my-zsh.tar.gz .oh-my-zsh
    tar -zxvf oh-my-zsh.tar.gz -C /root
fi

cp $BASE_PATH/.bash* /root
cp $BASE_PATH/.zsh* /root

fn_log " end..."
