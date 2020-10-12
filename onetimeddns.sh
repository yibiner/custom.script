#!/bin/bash

cd /tmp/custom.scripts
date >> ddns.log
bash ddnspod.sh >> ddns.log
