#!/bin/bash

jam=`date +"%H"`
menit=`date +"%M"`
tanggal=`date +"%d"`
bulan=`date +"%m"`
tahun=`date +"%Y"`

nama_file="$jam:$menit $tanggal-$bulan-$tahun"

huruf_kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
huruf_besar="ABCDEFGHIJKLMNOPQRRSTUVWXYZABCDEFGHIJKLMNOPQRRSTUVWXYZ"


cat /var/log/syslog | tr "${huruf_besar:0:26}" "${huruf_besar:${jam}:26}" | tr "${huruf_kecil:0:26}" "${huruf_kecil:${jam}:26}" > ~/Documents/sisop/modul1/"$nama_file"



