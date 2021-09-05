
.model small
.stack 100h
.data
    Cadena1 db 'Vernik Yaxon - 201712057 - HT2',10,13,'$' 
    divisible db 'Divisible',10,13,'$'
    noDivisible db 'No Divisible',10,13,'$'
    lista1 dw 20,50,98,54,35, 798,415,347,500, 600
    lista2 dw 10,5,2,5,7,63,11,21,50,60
    acumulador db 0 ;es de tipo byte 
    cero db 0

.code 
main proc
    mov ax,@data
    mov ds,ax
;Imprime mensaje Cadena 1 "Vernik Yaxon"
    mov ah,09h
    lea dx, Cadena1
    int 21h
                   
    mov bx,0
                   
     
    inicio:
        ;dividiendo 20/10
        xor ax,ax
        mov ax, lista1[bx]              
        mov dx, lista2[bx]
        div dl
        mov acumulador, ah  
          
        mov al,acumulador
        cmp al,cero 
        jz divisi
        jmp nodivisi                      
              
	
	
	divisi: 
	
	    mov ah,09h
        lea dx, divisible
        int 21h
        jmp fin
	
	
	
	nodivisi: 
	    mov ah,09h
        lea dx, noDivisible
        int 21h
	
	
	fin: 
	    inc bx
        inc bx
	    mov ax,18
	    cmp bx,ax  
	    jbe inicio
	
    
    .exit
main endp
end main