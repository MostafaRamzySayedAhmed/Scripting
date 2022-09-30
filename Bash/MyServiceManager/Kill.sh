#!/bin/bash

myservice=$(ps -aux | grep -e myservice | awk -F ' ' '{print $2}' | xargs)

if [ ! -z "$myservice" ] # if service exists
then
      kill -9 $myservice
else
      : # do nothing
fi