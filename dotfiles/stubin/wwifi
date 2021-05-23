#!/bin/bash

ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d ':' -f2)
echo 'Access Point: '$ssid

sudo cat $(find /etc/NetworkManager/system-connections/ -name "*${ssid}*") 2>/dev/null | grep 'psk=' | sed 's/psk=/password: /g'
