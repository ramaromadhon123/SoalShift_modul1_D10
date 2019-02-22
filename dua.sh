#!/bin/bash

printf "\na. Negara dengan penjualan terbanyak pada tahun 2012 adalah: \n"
awk -F, '/2012/ {a[$1]+=$10} END{for(i in a) print i",",a[i]}' WA_Sales_Products_2012-14.csv | sort -t $"," -n -k2 -r | awk -F, '{print $1}' | head -1

printf "\nb. Tiga product line yang memberikan penjualan terbanyak pada (a) adalah: \n"
awk -F, -v negara="$negara" '($1~negara) && ($7 == 2012) {a[$4]+=$10} END{for(i in a) print i",",a[i]}' WA_Sales_Products_2012-14.csv | sort -t $"," -n -k2 -r | head -3 | awk -F, '{print $1}'

printf "\nc. Tiga product yang memberikan penjualan terbanyak dari (b) adalah: \n"
awk -F ',' '{if ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection") a[$6]+=$10} END {for (b in a) {print a[b], b}}' WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk '{print $2" " $3}'
