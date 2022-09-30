#!/bin/bash

myservice=$(ls /etc/systemd/system | grep -e myservice | awk -F ' ' '{print $1}')

if [ ! -z "$myservice" ] # if service exists
then
      systemctl status $myservice | grep $myservice | echo -e `awk '{print $1 $2 $3 $4}'`
else
      : # do nothing
fi