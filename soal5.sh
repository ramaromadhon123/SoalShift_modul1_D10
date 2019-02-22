#!/bin/bash

`cat /var/log/syslog | awk '(!(/[Ss][Uu][Dd][Oo]/) && (/[Cc][Rr][Oo][Nn]/) && NF<13)' >> /home/ramrom/modul1/logs`
