#!/bin/bash

dev=$1

echo "----- START $0 ------"
echo "umount $dev"

sleep 1
if [ "$dev" == "mmcblk0" ] ; then
   echo "now umount /dev/${dev}p1 und p2"
   umount "/dev/${dev}p1"
   umount "/dev/${dev}p2"
else
   echo "now umount /dev/${dev}1 und 2"
   umount "/dev/${dev}1"
   umount "/dev/${dev}2"
fi 

echo "----- END $0 ------"
echo "::END::"
