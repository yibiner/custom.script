#!/usr/bin/bash

# 公共函数

function log_info () {
    if [ ! -d $BASE_PATH  ] ; then
        mkdir -p $BASE_PATH 
    fi

    DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
    USER_N=`whoami`
    echo "${DATE_N} ${USER_N} execute $0 [INFO] $@" >> $LOG_PATH #执行成功日志打印路径
}

function log_error () {
    DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
    USER_N=`whoami`
    echo -e "\033[41;37m ${DATE_N} ${USER_N} execute $0 [ERROR] $@ \033[0m"  >> $LOG_PATH #执行失败日志打印路径
}

function fn_log ()  {
    if [  $? -eq 0  ]
    then
        log_info "$@ sucessed."
        echo -e "\033[32m $@ sucessed. \033[0m"
    else
        log_error "$@ failed."
        echo -e "\033[41;37m $@ failed. \033[0m"
        exit 1
    fi
}
trap 'fn_log "DO NOT SEND CTR + C WHEN EXECUTE SCRIPT !!!! "'  2

export -f log_info
export -f log_error
export -f fn_log
