#!/bin/bash

root=${1:-""}
root=${root//\/\//\/}

f=`ls  -t1sr ${root}var/www/html/openWB/ramdisk/*.log 2>/dev/null | tail -1 | cut -d " " -f 2` 
dat=`stat -c%y $f 2>/dev/null | cut -d " " -f 1`
vers=`cat ${root}var/www/html/openWB/web/version`

echo "openWB: $vers $dat"	
