.model small
.code
org 100h
start:
    jmp mulai
nama	db 13,10,'Nama      : $';digunakan untuk memasukan inputan tertentu
ttl		db 13,10,'TTL       : $'
status	db 13,10,'Status	: $'
alamat	db 13,10,'Alamat	: $';digunakan untuk memasukan inputan tertentu

tampung_nama 	db 30,?,30 dup(?)
tampung_ttl		db 43,?,43 dup(?)
tampung_status 	db 43,?,43 dup(?)
tampung_alamat 	db 43,?,43 dup(?)
tampung_kode	db 13,?,43 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15

daftar 	db 13,10,'+---------------------------------------------------------------+'
		db 13,10,'|                        Daftar Obrolan       	    	      |'
		db 13,10,'+---+-------------------------+-------------------+-------------+'
		db 13,10,'|No |         Obrolan         | Waktu operasional |    Tarif    |'
		db 13,10,'+---+-------------------------+-------------------+-------------+'
		db 13,10,'| 1 |  Konsultasi via chat	|    09.00-20.00    | Rp. 200.000 |'
		db 13,10,'| 2 |  Konsultasi via telfon  |    09.00-15.00    | Rp. 299.000 |'
		db 13,10,'| 3 |  Penangan trauma		|    09.00-15.00    | Rp. 500.000 |'
		db 13,10,'| 4 |  Terapi                 |    09.00-15.00    | Rp. 600.000 |'
	 	db 13,10,'+---+-------------------------+-------------------+-------------+ ','$'  


pilih_menu	db 13,10,' Silahkan masukan menu obrolan yang anda pilih : $'
error		db 13,10,'Kode yang anda masukan salah $'
succes		db 13,10,' Selamat anda berhasil $'

    mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,ttl
	int 21h
	mov ah,0ah
	lea dx,tampung_ttl
	int 21h
	push dx  

	mov ah,09h
	lea dx,status
	int 21h
	mov ah,0ah
	lea dx,tampung_status
	int 21h
	push dx  

	mov ah,09h
	lea dx,alamat
	int 21h
	mov ah,0ah
	lea dx,tampung_alamat
	int 21h
	push dx  

	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov ah,01h

	mov ah,07h
	mov ah,01h
	jmp proses
	jmp error_msg
error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h
proses:
    mov ah,09h
    mov dx,offset pilih_menu
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    mov ah,1
    int 21h
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
    
    jne error_msg
;--------------------------------
hasil1:
	mov ah,09
	lea dx,teks1
	int 21h
 	int 20h
hasil2:
	mov ah,09
	lea dx,teks2
	int 21h
 	int 20h
hasil3:
	mov ah,09
	lea dx,teks3
	int 21h
 	int 20h
hasil4:
	mov ah,09
	lea dx,teks4
	int 21h
 	int 20h
;--------------------------------
teks1:	
    db 13,10,'-----------------------------------------------'
    db 13,10,'Anda memilih obrolan konsulatasi via chat'
	db 13,10,'Waktu terbaik konsultasi 09.00-20.00'
	db 13,10,'Total harga yang harus anda bayar Rp. 200.000'
	db 13,10,'Silahkan klik link berikut'
	db 13,10,'https://wa.me/081215133863'
	db 13,10,'Terimakasih telah menggunakan layanan kami ' 
	db 13,10,'-----------------------------------------------$'

teks2:	
    db 13,10,'-----------------------------------------------'
    db 13,10,'Anda memilih obrolan konsulatasi via telfon'
	db 13,10,'Waktu terbaik konsultasi 09.00-15.00'
	db 13,10,'Total harga yang harus anda bayar Rp. 299.000'
	db 13,10,'Silahkan klik link berikut'
	db 13,10,'https://wa.me/081215133863'
	db 13,10,'Terimakasih telah menggunakan layanan kami ' 
	db 13,10,'-----------------------------------------------$'

teks3:	
    db 13,10,'-----------------------------------------------'
    db 13,10,'Anda memilih obrolan penangan trauma'
	db 13,10,'Waktu terbaik konsultasi 09.00-15.00'
	db 13,10,'Total harga yang harus anda bayar Rp. 500.000'
	db 13,10,'Silahkan klik link berikut'
	db 13,10,'https://wa.me/081215133863'
	db 13,10,'Terimakasih telah menggunakan layanan kami '
	db 13,10,'-----------------------------------------------$'

teks4:	
    db 13,10,'-----------------------------------------------'
    db 13,10,'Anda memilih obrolan terapi'
	db 13,10,'Waktu terbaik konsultasi 09.00-15.00'
	db 13,10,'Total harga yang harus anda bayar Rp. 600.000'
	db 13,10,'Silahkan klik link berikut'
	db 13,10,'https://wa.me/081215133863'
	db 13,10,'Terimakasih telah menggunakan layanan kami '
	db 13,10,'-----------------------------------------------$'
	
end start




 

	