#!/bin/bash

echo "----- START $0 ------"
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
  mkdir /media/${dev}_boot
  chmod 0777 /media/${dev}_boot
fi 
if [ ! -d  /media/${dev}_root ] ; then
  echo "create mountpoint /media/${dev}_root "
  mkdir /media/${dev}_root
  chmod 0777 /media/${dev}_root
fi


d1="/dev/${dev}1" 
d2="/dev/${dev}2"
if [ "$dev" == "mmcblk0" ] ; then
    d1="/dev/${dev}p1" 
    d2="/dev/${dev}p2"
fi 
echo "now mound /media/${dev}_boot"
mount  $d1 "/media/${dev}_boot"

echo "now mound /media/${dev}_root"
mount  $d2 "/media/${dev}_root"


mount |grep $dev
readlink /proc/$$/ns/mnt


echo "----- END $0 ------"
echo "::END::"
exit 0
