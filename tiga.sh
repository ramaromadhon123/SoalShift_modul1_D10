#!/bin/bash

echo "Masukkan jumlah password yang akan dibuat: "
read pwd

for((num=1; num<=n; num+=1))
do
	if [ -f ~/Password/password$i.txt ]
	then pwd=$pwd+1

	else
	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > ~/Password/password$i.txt

	fi
done
