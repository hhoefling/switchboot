#!/bin/bash

dev=$1

echo "umount $dev"
env
sleep 1

if [ "$dev" == "mmcblk0" ] ; then
   umount "/dev/${dev}p1"
   umount "/dev/${dev}p2"
else
   umount "/dev/${dev}1"
   umount "/dev/${dev}2"
fi 

echo "::END::"
