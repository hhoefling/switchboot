#!/bin/bash

dev=$1
echo "Wiederherstellen nextboot from $dev"
sleep 1

if [ -f /boot/bootcode.no.bin  ] ; then
   echo "Reaaktive Boot /boot/bootcode.bin "
   mv /boot/bootcode.no.bin /boot/bootcode.bin
fi

# alle andere abschalten if 
if [ -f /media/sda_boot/bootcode.bin ] ; then
      echo "deaktiviere Boot /media/sda_boot/bootcode.bin"
      mv /media/sda_boot/bootcode.bin /media/sda_boot/bootcode.no.bin
fi
if [ -f /media/sdb_boot/bootcode.bin ] ; then
      echo "deaktiviere Boot /media/sdb_boot/bootcode.bin"
      mv /media/sdb_boot/bootcode.bin /media/sdb_boot/bootcode.no.bin
fi
if [ -f /media/sdc_boot/bootcode.bin ] ; then
      echo "deaktiviere Boot /media/sdc_boot/bootcode.bin"
      mv /media/sdc_boot/bootcode.bin /media/sdc_boot/bootcode.no.bin
fi
if [ -f /media/sdd_boot/bootcode.bin ] ; then
      echo "deaktiviere Boot /media/sdd_boot/bootcode.bin"
      mv /media/sdd_boot/bootcode.bin /media/sdd_boot/bootcode.no.bin
fi

if [ -f /media/mmcblk0_boot/bootcode.bin ] ; then
      echo "deaktiviere Boot /media/mmcblk0_boot/bootcode.bin"
      mv /media/mmcblk0_boot/bootcode.bin /media/mmcblk0_boot/bootcode.no.bin
fi

  

echo "Done" 
echo "::END::"
exit


