# SoalShift_modul1_D10

# soal 4

pada soal ini meminta kita untuk mem-backup file syslog setiap jam dangan format nama file yang telah ditentukan. isi dari file tersebut harus terenkripsi dengan konversi huruf yang disesuakan dengan jam pada saat melakukan backup file. kita juga harus membuat bash script untuk dekripsi.

pertama kita untuk membuat nama file dengan format yang di tebtukan. kita akan membuat nama file dengan cara berikut :

jam=`date +"%H"`
menit=`date +"%M"`
tanggal=`date +"%d"`
bulan=`date +"%m"`
tahun=`date +"%Y"`

nama_file="$jam:$menit $tanggal-$bulan-$tahun"

untuk metode pengekripsiannya kita akkan mendeklarasi 2 variable yang akan digunakan untuk mengekripsi hasil backup. yaitu:

huruf_kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
huruf_besar="ABCDEFGHIJKLMNOPQRRSTUVWXYZABCDEFGHIJKLMNOPQRRSTUVWXYZ"

untuk proses mengekripsi file syslog maka kita akan mengubah 2 variable diatas sesuai dengan ketentuan soal lalu akan mengekripdi file syslog :

cat /var/log/syslog | tr "${huruf_besar:0:26}" "${huruf_besar:${jam}:26}" | tr "${huruf_kecil:0:26}" "${huruf_kecil:${jam}:26}" > ~/Documents/sisop/modul1/"$nama_file"

untuk menjalankan tiap jam dari bash script maka kita akan menggunakan crontab :

@hourly /home/bash /home/ramrom/Documents/sisop/modul1/soal4.sh

untuk melakukan dekripsi maka kita akan menyimpan nama file dari hasil backup, mengambil jam waktu pengekripsian:

nama_file="$1"
nama_filedec="$1dec"
jam="${nama_file:0:2}"

dan juga kita akan membuat 2 variable yang akan kita manfaatkan untuk mendekripsi


huruf_kecil="abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
huruf_besar="ABCDEFGHIJKLMNOPQRRSTUVWXYZABCDEFGHIJKLMNOPQRRSTUVWXYZ"

untuk melakukan pengdekripsian maka menggunakan script :

cat  ~/Documents/sisop/modul1/"$nama_file" | tr "${huruf_besar:0:26}" "${huruf_besar:${bnyk}-${jam}:26}" | tr "${huruf_kecil:0:26}" "${huruf_kecil:${bnyk}-${jam}:26}" > ~/Documents/sisop/modul1/"$nama_filedec"




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
   
