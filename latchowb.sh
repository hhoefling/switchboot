#!/bin/bash

dev=$1
echo "Kopieren Daten der openWB zum Gerät $dev"
sleep 1
src=/var/www/html
dst="/media/${dev}_root/var/www/html"
echo "Source: $src "
echo "Destination: $dst "

echo "Sichere MQTT Daten"
# tell mosquitto to store all retained topics in db now
for pid in $(pidof "mosquitto"); do
    echo "Sende SIGUSR1 zu Mosquitto pid: '$pid' "
    sudo kill -s SIGUSR1 "$pid"
done

# give mosquitto some time to finish
sleep 1.5
ls -l /var/lib/mosquitto/mosquitto.db
echo "copy mosquittp-db to /media/${dev}_root/var/lib/mosquitto/mosquitto.db "
cp -p /var/lib/mosquitto/mosquitto.db /media/${dev}_root/var/lib/mosquitto/mosquitto.db

if [ -d ${dst}/openWB ] ; then
  echo "copy ${src}/openWB to ${dst}/openWB "
  echo "cp -rp  ${src}/openWB ${dst}/."
  cp -rp  ${src}/openWB ${dst}/
fi


echo "cp -rpv  ${src}/switchboot ${dst}/"
cp -rpv  ${src}/switchboot ${dst}/
echo "remove logfile"
rm -f ${dst}/switchboot/*.log 


echo "cp -rpv  ${src}/snapper ${dst}/"
cp -rpv  ${src}/snapper ${dst}/
echo "remove logfile "
rm -f ${dst}/snapper/*.log 


echo "Done" 
echo "::END::"
exit

src=/var/www/html/openWB/web/logging/data
dst=/media/${dev}_root/var/www/html/openWB/web/logging/data

(cd $src; tar -cpf - . ) |  (cd $dst; tar -xvpf - )

# echo "cp -rp ${src}/* ${dst}/. "
# sudo cp -rp ${src}/* ${dst}/.
echo "::END::"
