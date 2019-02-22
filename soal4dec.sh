#!/bin/bash

nama_file="$1"
nama_filedec="$1dec"
jam="${nama_file:0:2}"

bnyk=26

huruf_kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
huruf_besar="ABCDEFGHIJKLMNOPQRRSTUVWXYZABCDEFGHIJKLMNOPQRRSTUVWXYZ"

cat  ~/Documents/sisop/modul1/"$nama_file" | tr "${huruf_besar:0:26}" "${huruf_besar:${bnyk}-${jam}:26}" | tr "${huruf_kecil:0:26}" "${huruf_kecil:${bnyk}-${jam}:26}" > ~/Documents/sisop/modul1/"$nama_filedec"
