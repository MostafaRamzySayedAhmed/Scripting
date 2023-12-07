#!/bin/bash

service_1=$(ps -aux | grep -e text1 | awk -F ' ' '{print $2}' | xargs)
service_2=$(ps -aux | grep -e text2 | awk -F ' ' '{print $2}' | xargs)
service_3=$(ps -aux | grep -e text3 | awk -F ' ' '{print $2}' | xargs)

if [ ! -z "$service_1" ] # if service exists
then
      kill -9 $service_1
else
      :
fi

if [ ! -z "$service_2" ] # if service exists
then
      kill -9 $service_2
else
      :
fi

if [ ! -z "$service_3" ] # if service exists
then
      kill -9 $service_3
else
      :
fi