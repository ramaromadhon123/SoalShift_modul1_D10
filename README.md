# SoalShift_modul1_D10

# soal 1
Pada soal ini kita diberikan file nature.zip yang harus di dekripsi dengan syarat bahwa file tersebut akan dibuka pada pukul 14:14 tanggal 14 Februari, atau hari tersebut adalah hari Jumat pada bulan Februari.

Maka setelah mengunduh file nature.zip, untuk membukanya kita gunakan perintah unzip, lalu karena folder tersebut berisi kumpulan foto yang di encrypt, kita bisa menggunakan command base64 -d untuk melakukan decrypt, sebab foto di enkripsi dengan base64.
Proses tersebut menghasilkan hexadecimal, jadi untuk mengembalikannya ke format awal, kita gunakan command xxd -r.

Pada crontab ditambahkan perintah "14 14 14 2 5" sebagai schedulenya.

# soal 2
Soal ini meminta kita untuk memberi beberapa laporan dari file WA_Sales_Products_2012-14.csv.

a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
b  Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.

Laporan-laporan tersebut dapat didapatkan menggunakan awk.

#soal 3
Soal ini meminta kita untuk menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
1. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
2. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
3. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
Password yang dihasilkan tidak boleh sama.

Maka, pertama kita minta input dari user untuk menentukan berapa banyak password yang ingin dibuat, lalu melakukan  perulangan sebanyak jumlah tersebut.
Kita tambahkan if untuk mengecek apakah file password.txt sebelumnya sudah ada, jika belum maka kita masukkan syntax yang akan membuat sebuah file password1.txt berisi random string sesuai persyaratan, lalu dimasukkan ke folder yang telah ditetapkan.

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
   
