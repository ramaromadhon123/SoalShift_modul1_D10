#!/bin/bash

unzip ~/Downloads/nature.zip
foto=`ls ~/Downloads/nature | grep "[.]jpg$"` 

for i in $foto
do
	base64 -d ~/Downloads/nature/"$i" | xxd -r > ~/Downloads/nature/"res$i" 
done

