# switchboot
Rapsberry-Pi Boot selector
![switchboot](https://github.com/hhoefling/switchboot/assets/89247538/5f3d4e00-f385-4e48-92db-f8e4055a503a)


## Raspberry Pi 3B+ ##

Ein eingestecker USB-Stick oder eine SD-Karte im USB-Kartenleser wird nicht automatisch gebootet. Der Interne SD-Slot hat immer vorrang. Um sich das entnehmen der SD Karte zu sparen wird folgendes Verfahren angewendet.
Es existiert auf allem Medien nur eine **bootcode.bin** auf allen anderen Medien wird die Datei **/boot/bootcode.bin** umbenannt zu **/boot/bootcode.no.bin**
So wird das booten von sda oder sdb ermöglicht ohne die Karte zu entnehmen.

## Raspberry Pi 4B+ ##

Hier haben die USB Geräte vorrang, das ändert aber nichts am Problem. Daher wird auch hier das obige verfahren angewendet um sicherzustellen welches Device zum  booten verwendet wird ohne die anderen Medien zu entfernen.

## Sicherheit ##
Wer mag kann mit einer **.htaccess** den Zugriff auf das Script neugierigen Blicken entziehen.
```
::::::::::::::
.htaccess
::::::::::::::
AuthType Basic
AuthUserFile /var/www/html/switchboot/.passwd
AuthName "Switchboot"
require valid-user

<Files ".passwd">
  Require all denied
</Files>
```
```
::::::::::::::
.passwd
::::::::::::::
chefe:$apr1$cYgSwDWO$bbFsuvhG/IV.Zrak4IqOa.
```
Passwort wird nicht verraten...:-)





