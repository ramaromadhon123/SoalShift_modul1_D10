#!/bin/bash

i=1
tes=1

while [ $i -ne 0 ]
do
	if [[ -f ~/Password/password$tes.txt ]]
	then
	
	tes=$((tes + 1))

	else
	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1 > ~/Password/password$tes.txt
	i=0
	fi

done
