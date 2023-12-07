#!/bin/bash

service_1=$(ls /etc/systemd/system | grep -e text1 | awk -F ' ' '{print $1}')
service_2=$(ls /etc/systemd/system | grep -e text2 | awk -F ' ' '{print $1}')
service_3=$(ls /etc/systemd/system | grep -e text3 | awk -F ' ' '{print $1}')

if [ ! -z "$service_1" ] # if service exists
then
      systemctl stop $service_3
      sleep 30 # 30s
      echo "$service_3 stopped"
else
      :
fi

if [ ! -z "$service_3" ] # if service exists
then
      if [ $(systemctl is-active $service_3) == "inactive" ] # if service is not active
      then
            if [ ! -z "$service_2" ] # if service exists
            then
                  systemctl stop $service_2
                  sleep 30 # 30s
                  echo "$service_2 stopped"
            else
                  :
            fi
      else
      echo "$service_3 is either active or failed, Please check !"
      exit
      fi
elif [ ! -z "$service_2" ]
then
      systemctl stop $service_2
      sleep 30 # 30s
      echo "$service_2 stopped"
else
:
fi

if [ ! -z "$service_2" ] # if service exists
then
      if [ $(systemctl is-active $service_2) == "inactive" ] # if service is not active
      then
            if [ ! -z "$service_1" ] # if service exists
            then
                  systemctl stop $service_1
                  sleep 30 # 30s
                  echo "$service_1 stopped"
            else
                  :
            fi
      else
      echo "$service_2 is either active or failed, Please check !"
      exit
      fi
elif [ ! -z "$service_1" ]
then
      systemctl stop $service_1
      sleep 30 # 30s
      echo "$service_1 stopped"
else
:
fi