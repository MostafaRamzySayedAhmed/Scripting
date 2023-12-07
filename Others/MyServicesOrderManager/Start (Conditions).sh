#!/bin/bash

service_1=$(ls /etc/systemd/system | grep -e text1 | awk -F ' ' '{print $1}')
service_2=$(ls /etc/systemd/system | grep -e text2 | awk -F ' ' '{print $1}')
service_3=$(ls /etc/systemd/system | grep -e text3 | awk -F ' ' '{print $1}')

if [ ! -z "$service_1" ] # if service exists
then
      systemctl start $service_1
      sleep 30 # 30s
      echo "$service_1 started"
else
      :
fi

if [ ! -z "$service_1" ] # if service exists
then
      if [ $(systemctl is-active $service_1) == "active" ] # if service is active
      then
            if [ ! -z "$service_2" ] # if service exists
            then
                  systemctl start $service_2
                  sleep 30 # 30s
                  echo "$service_2 started"
            else
                  :
            fi
      else
      echo "$service_1 is either inactive or failed, Please check !"
      exit
      fi
elif [ ! -z "$service_2" ]
then
      systemctl start $service_2
      sleep 30 # 30s
      echo "$service_2 started"
else
:
fi

if [ ! -z "$service_2" ] # if service exists
then
      if [ $(systemctl is-active $service_2) == "active" ] # if service is active
      then
            if [ ! -z "$service_3" ] # if service exists
            then
                  systemctl start $service_3
                  sleep 30 # 30s
                  echo "$service_3 started"
            else
                  :
            fi
      else
      echo "$service_2 is either inactive or failed, Please check !"
      exit
      fi
elif [ ! -z "$service_3" ]
then
      systemctl start $service_3
      sleep 30 # 30s
      echo "$service_3 started"
else
:
fi