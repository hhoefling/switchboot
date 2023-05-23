#!/bin/bash

dev=$1
echo "Aktiviere next boot from $dev"
sleep 1
dst="/media/${dev}_boot/"

if [ -f /boot/bootcode.bin  ] ; then
   echo "deaktive Boot /boot/bootcode.bin "
   mv /boot/bootcode.bin /boot/bootcode.no.bin
   if [ -f ${dst}/bootcode.no.bin ] ; then
      echo "aktiviere Boot ${dst}/bootcode.no.bin "
      mv ${dst}/bootcode.no.bin  ${dst}/bootcode.bin
      [ ! -d  /media/${dev}_root/media  ] && mkdir /media/${dev}_root/media    
      [ ! -d  /media/${dev}_root/media/sda_boot  ] && mkdir /media/${dev}_root/media/sda_boot    
      [ ! -d  /media/${dev}_root/media/sda_root  ] && mkdir /media/${dev}_root/media/sda_root    
      [ ! -d  /media/${dev}_root/media/sdb_boot  ] && mkdir /media/${dev}_root/media/sdb_boot    
      [ ! -d  /media/${dev}_root/media/sdb_root  ] && mkdir /media/${dev}_root/media/sdb_root    
      [ ! -d  /media/${dev}_root/media/sdc_boot  ] && mkdir /media/${dev}_root/media/sdc_boot    
      [ ! -d  /media/${dev}_root/media/sdc_root  ] && mkdir /media/${dev}_root/media/sdc_root    
      [ ! -d  /media/${dev}_root/media/sdd_boot  ] && mkdir /media/${dev}_root/media/sdd_boot    
      [ ! -d  /media/${dev}_root/media/sdd_root  ] && mkdir /media/${dev}_root/media/sdd_root
      [ ! -d  /media/${dev}_root/media/mmcblk0_boot  ] && mkdir /media/${dev}_root/media/mmcblk0_boot    
      [ ! -d  /media/${dev}_root/media/mmcblk0_root  ] && mkdir /media/${dev}_root/media/mmcblk0_root
      echo "mountpoints on $dev"    
      ls -ld /media/${dev}_root/media/*    
   
  fi
fi


echo "Done" 
echo "::END::"
exit


