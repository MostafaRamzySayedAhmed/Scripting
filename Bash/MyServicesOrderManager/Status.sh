#!/bin/bash

service_1=$(ls /etc/systemd/system | grep -e text1 | awk -F ' ' '{print $1}')
service_2=$(ls /etc/systemd/system | grep -e text2 | awk -F ' ' '{print $1}')
service_3=$(ls /etc/systemd/system | grep -e text3 | awk -F ' ' '{print $1}')

if [ ! -z "$service_1" ] # if service exists
then
      echo "Service: $service_1 status is: $(systemctl is-active $service_1)"
else
      :
fi

if [ ! -z "$service_2" ] # if service exists
then
      echo "Service: $service_2 status is: $(systemctl is-active $service_2)"
else
      :
fi

if [ ! -z "$service_3" ] # if service exists
then
      echo "Service: $service_3 status is: $(systemctl is-active $service_3)"
else
      :
fi