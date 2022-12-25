.model small
.code
org 100h
start:
	jmp mulai
nama	  db 13,10,'Nama Anda	: $'
nim	  db 13,10,'NIM	: $'
lanjut  db 13,10,'LANJUT Tekan y untuk lanjut >>>>>>>>>>>>> $'
tampung_nama  db 30,?,30 dup(?)
tampung_nim   db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar  db 13,10,'+-------------------------------------------------+'
	 db 13,10,'|	      DAFTAR HARGA KOLAM & HARI              |'
	 db 13,10,'+---+---------------------+----------------+-----+'
	 db 13,10,'|	                   KOLAM                     |'
	 db 13,10,'+---+---------------------+----------------+-----+'
	 db 13,10,'|N0 |       Jenis       |   Hari     + Harga     |'
 	 db 13,10,'+---+-------------------+----------------+-------+'
	 db 13,10,'|01 |    Kolam Kecil    |   Weekday + Rp. 10.000 |'
	 db 13,10,'+---+-------------------+----------------+-------+'
	 db 13,10,'|02 |    Kolam Kecil    |   Weekend + Rp. 15.000 |'
	 db 13,10,'+---+-------------------+----------------+-----+-'
	 db 13,10,'|03 |    Kolam Sedang   |   Weekday + Rp. 20.000 |'
	 db 13,10,'+---+---------------------+----------------+-----+'
	 db 13,10,'|04 |    Kolam Sedang   |   Weekend + Rp. 25.000 |'
	 db 13,10,'+---+---------------------+----------------+-----+'
	 db 13,10,'|05 |    Kolam Besar    |   Weekday + Rp. 30.000 |'
	 db 13,10,'+---+---------------------+----------------+-----+'
	 db 13,10,'|06 |    Kolam Besar    |   Weekend + Rp. 35.000 |'
	 db 13,10,'+---+---------------------+----------------+-----+','$'



error	    db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_tkt  db 13,10,'Silahkan Masukkan No/Kode Tiket Yang Anda Pilih: $'
Success    db 13,10,'Selamat Anda Berhasil $'

	 mulai:
	 mov ah,09h
	 lea dx,nama
	 int 21h
	 mov ah,0ah
	 lea dx,tampung_nama
	 int 21h
	 push dx

	 mov ah,09h
	 lea dx,nim
	 int 21h
	 mov ah,0ah
	 lea dx,tampung_nim
	 int 21h
	 push dx

	 mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg

error_msg:
	  mov ah,09h
	  mov dx,offset error
	  int 21h
	  int 20h

proses:
	 mov ah,09h
	 mov dx,offset pilih_tkt
	 int 21h

	 mov ah,1
	 int 21h
	 mov bh,al
	 mov ah,1
	 int 21h
	 mov bl,al
	 cmp bh,'0'
	 cmp bl,'1'
	 je hasil1

	 cmp bh,'0'
	 cmp bl,'2'
	 je hasil2

	 cmp bh,'0'
	 cmp bl,'3'
	 je hasil3

	 cmp bh,'0'
	 cmp bl,'4'
	 je hasil4

	 cmp bh,'0'
	 cmp bl,'5'
	 je hasil5

	 cmp bh,'0'
	 cmp bl,'6'
	 je hasil6

	 jne error_msg

;-----------------------------------------------

hasil1:
	 mov ah,09h
	 lea dx, teks1
	 int 21h
	 int 20h

hasil2:
	 mov ah,09h
	 lea dx, teks2
	 int 21h
	 int 20h

hasil3:
	 mov ah,09h
	 lea dx, teks3
	 int 21h
	 int 20h

hasil4:
	 mov ah,09h
	 lea dx, teks4
	 int 21h
	 int 20h

hasil5:
	 mov ah,09h
	 lea dx, teks5
	 int 21h
	 int 20h

hasil6:
	 mov ah,09h
	 lea dx, teks6
	 int 21h
	 int 20h

;-----------------------------------------------

teks1	 db 13,10,'Anda Memilih JENIS KOLAM KECIL'
	 db 13,10,'Hari WEEKDAY'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 10.000'
	 db 13,10,'Terima Kasih $'

teks2	 db 13,10,'Anda Memilih JENIS KOLAM KECIL'
	 db 13,10,'Hari WEEKDAY'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 15.000'
	 db 13,10,'Terima Kasih $'

teks3	 db 13,10,'Anda Memilih JENIS KOLAM SEDANG'
	 db 13,10,'Hari WEEKDAY'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 20.000'
	 db 13,10,'Terima Kasih $'

teks4	 db 13,10,'Anda Memilih JENIS KOLAM SEDANG'
	 db 13,10,'Hari WEEKEND'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 25.000'
	 db 13,10,'Terima Kasih $'

teks5	 db 13,10,'Anda Memilih JENIS KOLAM BESAR'
	 db 13,10,'Hari WEEKDAY'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 30.000'
	 db 13,10,'Terima Kasih $'

teks6	 db 13,10,'Anda Memilih JENIS KOLAM BESAR'
	 db 13,10,'Hari WEEKEND'
	 db 13,10,'Total Harga YAng Harus Anda Bayar: Rp. 35.000'
	 db 13,10,'Terima Kasih $'
	int 20h
end start



