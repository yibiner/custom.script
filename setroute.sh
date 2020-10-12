#!/usr/bin/bash

# 设置百兆、千兆网卡走不同路由，互不影响
hadlan=`grep "lan" /etc/iproute2/rt_tables`
# 新建一个编号为200 ，名字为lan的路由表
if [ -z "$hadlan" ] ; then
    echo "200 lan" >> /etc/iproute2/rt_tables
fi

# 删除default路由表中千兆网的配置
had1G=`ip route list | grep "192.168.1.0/24 dev br1 proto dhcp scope link src 192.168.1.5"`
if [ -n "$had1G" ] ; then
    ip route del 192.168.1.0/24 dev br1 proto dhcp scope link src 192.168.1.5 metric 215
fi

# 往 lan 路由表 中新增路由
had1G=`ip route list table lan | grep "192.168.1.5"`
if [ -z "$had1G" ] ; then
    ip route add 192.168.1.0/24 dev br1 proto dhcp scope link src 192.168.1.5 metric 215 table lan
fi

# 设置千兆网卡流量只看 lan 路由表
had1G=`ip rule | grep "from 192.168.1.5 lookup lan"`
if [ -z "$had1G" ] ; then
    ip rule add from 192.168.1.5 table lan
fi

fn_log " end..."
