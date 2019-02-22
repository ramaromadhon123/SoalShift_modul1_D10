# SoalShift_modul1_D10

# soal 5
untuk soal no 5 kita diminta untuk menyimpan data syslog yang dimana pada data tersebut tidak terdapat kata sudo, terdapat kata cron dan tidak masalah apakah kata tersebut kapital atau tidak, serta jumlah field harus kurang dari 13. setelah mendapatkan data tersebut, kita diminta untuk memasukkan data tersebut kedalam direktori yang telah ditentukan. pada soal tersebut juga kita diminta untuk menjalankan script tiap 6 menit dari menit ke 2 hingga ke 30.

untuk menyelsaikan soal init kita harus melakukan beberapa langkah, yaitu:

i. untuk mengambil data kita harus kita akan menggunaka script :
   
   cat /var/log/syslog
 
ii. untuk mendapatkan kurang dari 13 record yang didalamnya tidak terdapat kata sudo dan terdapat kata cron maka kita menggunakan script :

   awk '(!(/[Ss][Uu][Dd][Oo]/) && (/[Cc][Rr][Oo][Nn]/) && NF<13)'
   
   pada kasus ini kita menggunakan awk, dan untuk membatasi field kita menggunakan NF
 
iii. untuk menyimpan file ke direktori yang telah ditentukan maka kita akan menggunaka script :

       >> /home/ramrom/modul1/logs`
       
iv. untuk mengatur waktu script akan di jalankan kita akan mengatur crontab :

   2-30/6 * * * * /home/bash /home/ramrom/Documents/sisop/modul1/soal5.sh
