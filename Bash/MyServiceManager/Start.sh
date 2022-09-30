#!/bin/bash

myservice=$(ls /etc/systemd/system | grep -e myservice | awk -F ' ' '{print $1}')

if [ ! -z "$myservice" ] # if service exists
then
      systemctl start $myservice
else
      : # do nothing
fi