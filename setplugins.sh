#!/usr/bin/bash

# autofan 修改为根据 CPU 温度调节转速
filename=/usr/local/emhttp/plugins/dynamix.system.autofan/scripts/autofan
if [ -e $filename ] ; then
    # sed -i 'N;196afunction_get_current_cpu_temp() {\nHIGHEST_TEMP=0\nHIGHEST_TEMP=`sensors | grep "CPU Temp" | awk "{print $3}" | tr -cd "[0-9.]" | sed "s/\..*//g"`\n}' $filename
    # sed -i 'N;292afunction_get_current_cpu_temp' $filename
    # sed -i '292 d' $filename
    cp $BASE_PATH/autofan $filename
    /usr/local/emhttp/plugins/dynamix.system.autofan/scripts/rc.autofan restart
fi

fn_log " end..."
