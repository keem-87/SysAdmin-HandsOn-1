#!/bin/bash

sudo apt-get install ssmpt > /dev/null
sudo apt-get install mailutils > /dev/null

current = $(date | cut -c1-13)
hourLap = $(date -d "1 hours ago" | cut -c1-13)
tlength = $(date -r /var/webserver_monitor/unauthorized.log | cut -c1-17)

if [ "$hrLap" == "$tlength" ]; then
        contents = "No unauthorized attempts."
else
        contents =$(sudo sed -n '/"$hourLap"/,/"$current"/p' /var/webserver_monitor/unauthorized.log)
fi
echo "No unauthorized access!!!" | mail -s "Unauthorized.log Hourly Update" RR935981@wcupa.edu -A "$contents"
