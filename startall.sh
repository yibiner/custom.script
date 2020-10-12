#!/usr/bin/bash

# 运行所有脚本

cd /tmp/custom.scripts

. config.sh
. commfunc.sh

cd $BASE_PATH
files=$(ls $BASE_PATH | grep -E "set.*.sh")
for filename in $files
do
   bash $filename
done

files=$(ls $BASE_PATH | grep -E "loop.*.sh")
for filename in $files
do
   nohup bash $filename > output.put 2>&1 &
done

