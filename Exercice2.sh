#!/bin/bash

sudo apt-get install cron
sudo service cron start

cron_tab = "*/5 * * * * /bin/bash /Exercice1.sh /personnages-\$(date +\%Y-\%m-\%d)"

(crontab -l; echo "$cron_tab" ) | crontab -