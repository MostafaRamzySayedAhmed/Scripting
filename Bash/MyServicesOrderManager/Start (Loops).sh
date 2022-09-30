#!/bin/bash

service_1=$(ls /etc/systemd/system | grep -e text1 | awk -F ' ' '{print $1}')
service_2=$(ls /etc/systemd/system | grep -e text2 | awk -F ' ' '{print $1}')
service_3=$(ls /etc/systemd/system | grep -e text3 | awk -F ' ' '{print $1}')

for service in "$service_1" "$service_2" "$service_3"; do
  if [[ -n "$service" ]]; then # if service exists
    systemctl start "$service"
    sleep 30 # 30s
    until systemctl status active "$service" >/dev/null; do # if service is active
      systemctl start "$service"
      sleep 30 # 30s
      if [ $(systemctl is-active $service) != "active" ] # if service is not active
      then
            echo "$service is either inactive or failed, Please check !"
            exit
      fi
    done
  fi
done