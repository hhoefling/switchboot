#!/bin/bash

dev=$1
echo "Deaktiviere boot from $dev"
sleep 1
dst="/media/${dev}_boot"

if [ -f ${dst}/bootcode.bin  ] ; then
   echo "deaktive Boot ${dst}/bootcode.bin "
   mv ${dst}/bootcode.bin ${dst}/bootcode.no.bin
fi

echo "Done" 
echo "::END::"
exit


