#!/bin/bash

service_1=$(ls /etc/systemd/system | grep -e text1 | awk -F ' ' '{print $1}')
service_2=$(ls /etc/systemd/system | grep -e text2 | awk -F ' ' '{print $1}')
service_3=$(ls /etc/systemd/system | grep -e text3 | awk -F ' ' '{print $1}')

for service in "$service_3" "$service_2" "$service_1"; do
  if [[ -n "$service" ]]; then  # if service exists
    systemctl stop "$service"
    sleep 30 # 30s
    until systemctl status inactive "$service" >/dev/null; do # if service is inactive
      sleep 10 # 30s
      systemctl stop "$service"
      if [ $(systemctl is-active $service) == "active"] # if service is active
      then
            echo "$service is either active or failed, Please check !"
            exit
      fi
    done
  fi
done