# IT Security Project
Script Security (Backup, Monitoring, Logging)

Secara garis besar, script bash tersebut berfungsi untuk menghitung dan menampilkan jumlah kemunculan (request) dari setiap IP address yang tercatat di dalam sebuah file log otentikasi.

#!/bin/bash
Ini disebut shebang. Fungsinya untuk memberi tahu sistem operasi bahwa script ini harus dieksekusi menggunakan interpreter shell Bash.

LOG="../logs/auth.log"
Mendeklarasikan sebuah variabel bernama LOG yang menyimpan path (lokasi path relatif) dari file log yang akan dianalisis, yaitu ../logs/auth.log.

echo "=== JUMLAH REQUEST PER IP ==="
Mencetak teks judul "=== JUMLAH REQUEST PER IP ===" ke layar terminal sebagai header output.

awk '{print $1}' $LOG | sort | uniq -c
Ini adalah baris inti dari script yang melakukan pemrosesan data. Baris ini terdiri dari tiga perintah yang dirangkai menggunakan operator pipe (|):

awk '{print $1}' $LOG: Membaca file log yang dituju dan mengekstrak/mengambil kolom pertama ($1) dari setiap baris teks. Dalam format log standar (seperti log web server atau log SSH), kolom pertama biasanya adalah alamat IP (IP address).

sort: Menerima daftar IP address dari perintah awk, lalu mengurutkannya. Pengurutan ini adalah syarat wajib sebelum data diproses oleh perintah uniq.

uniq -c: Mengelompokkan IP address yang sama persis, dan argumen -c (count) berfungsi untuk menghitung berapa kali masing-masing IP address tersebut muncul.