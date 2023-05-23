#!/bin/bash

dev=$1
echo "check mountpoints for $dev"
sleep 1

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


echo "mount $dev"
if [ "$dev" == "mmcblk0" ] ; then
    mount  "/dev/${dev}p1" "/media/${dev}_boot" 
    mount  "/dev/${dev}p2" "/media/${dev}_root"
else
    mount  "/dev/${dev}1" "/media/${dev}_boot"
    mount  "/dev/${dev}2" "/media/${dev}_root"
fi 



echo "::END::"
