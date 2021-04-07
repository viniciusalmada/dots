#!/usr/bin/env bash

CL=`nvidia-smi -q --display=CLOCK | grep Graphics | head -1 | awk '{ print $3 }'`
TMP=`nvidia-smi -q --display=TEMPERATURE | grep 'GPU Current Temp' | awk '{ print $5}'`
UTI=`nvidia-smi -q --display=UTILIZATION | grep Gpu | awk '{ print $3 }'`


OUT=`echo $UTI $CL $TMP | awk '{ printf " GPU: %2d%% %4.0f MHz %dºC \n", $1, $2, $3 }'`

echo "$OUT"
echo "$OUT"
echo "#FFFFFF"
echo "#282828"
