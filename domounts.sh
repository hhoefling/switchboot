#!/bin/bash

dev=$1
echo "check mountpoints for $dev"
sleep 1

if [ "$dev" == "" ] ; then
 echo "usage: $0 dev"
 exit 1
fi

echo "mount $dev"
if [ ! -d  /media/${dev}_boot ] ; then
  echo "create mountpoint /media/${dev}_boot "
  sudo mkdir /media/${dev}_boot
  sudo chmod 0777 /media/${dev}_boot
fi 
if [ ! -d  /media/${dev}_root ] ; then
  echo "create mountpoint /media/${dev}_root "
  sudo mkdir /media/${dev}_root
  sudo chmod 0777 /media/${dev}_root
fi


d1="/dev/${dev}1" 
d2="/dev/${dev}2"
if [ "$dev" == "mmcblk0" ] ; then
    d1="/dev/${dev}p1" 
    d2="/dev/${dev}p2"
fi 
mount  $d1 "/media/${dev}_boot"
mount  $d2 "/media/${dev}_root"


mount |grep $dev

echo "::END::"
exit 0
