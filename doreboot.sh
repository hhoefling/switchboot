#!/bin/bash

echo "Now reboot"
sleep 1
rm switchlog.log
sudo shutdown -r now
echo "::END::"

