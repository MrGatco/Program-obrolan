.model small
.code
org 100h
start:
    jmp mulai 
daftar 	db 13,10,'----------------------------------------'
        db 13,10,'            Program Obrolan             '
        db 13,10,'----------------------------------------$'
nama	db 13,10,'Nama      :$'
ttl		db 13,10,'TTL       :$'
status	db 13,10,'Status    :$'
alamat	db 13,10,'Alamat	:$'
garis   db 13,10,'----------------------------------------$'

tampung_nama 	db 30,?,30 dup(?)
tampung_ttl		db 43,?,43 dup(?)
tampung_status 	db 43,?,43 dup(?)
tampung_alamat 	db 43,?,43 dup(?)
tampung_kode	db 13,?,43 dup(?)

    mulai:  
    mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov ah,01h
	
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
	mov dx,offset garis
	int 21h
	mov ah,09h
	mov ah,01h 

	mov ah,07h
	mov ah,01h

end start
