#!/usr/bin/bash

# UPS 后备电源关机计划，通过 ping 路由器和国内网站。

# 最大 ping 失败次数。3*60s
MAX_PING_FAIL=60
cnt_err=0

while true
do
   ping -c 1 -w 1 192.168.1.1
   if [[ $? != 0 ]];then
      echo " ping fail "$cnt_err
      ((cnt_err++))
      # ping 超时为1s，保证正常单次判断都为3s
      sleep 2
   else
      cnt_err=0
      sleep 3
   fi

   if [ $cnt_err -ge $MAX_PING_FAIL ];then
      echo "shutdown system"
      shutdown -h now
      break
   fi
done
