#!/bin/bash

sudo apt-get install geoip-bin > /dev/null

array=()
grep "User is Invalid!!!" /var/log/auth.log >> holding.log
readarray array < holding.log

addIP = ""
addcountry = ""
addDate = ""
for i in "${array[@]}"; do
        addIP = "$(grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' <<< "$i")"
        addcountry = "$(geoiplookup -s $addIP)"
        addDate = $(echo "$i" | cut -c1-15)
        echo "$ipadd ""$addcountry ""$addDate" >> /var/webserver_log/unauthorized.log
done
sudo rm holding.log

