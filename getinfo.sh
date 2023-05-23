#!/bin/bash

bd=$(df | grep " /boot" | cut -f 1 -d " ")
#echo "bd:[$bd] "

if [ "$bd" == "/dev/sda1" ] ; then
 bdev=sda
elif [ "$bd" == "/dev/sdb1" ] ; then
 bdev=sdb
elif [ "$bd" == "/dev/mmcblk0p1" ] ; then
 bdev=mmcblk0
else
 echo "bootdevice nicht erkennbar"
 exit
fi
echo $bdev	
