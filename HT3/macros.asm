imprimir10h macro cadena,cantidad,color,columna, fila 
    push ax
    push bx
    push cx
    push dx

    lea bp, cadena
    mov al, 1
    mov bh, 0
    mov bl, color ; 15d blanco , 2h verde
    mov cx, cantidad
    mov dl, columna ;columna
    mov dh, fila ;fila
    mov ah, 13h ;funcionalidad escribir string/cadena
    int 10h

    pop dx
    pop cx
    pop bx
    pop ax
endm

imprimirChar macro caracter, color
    mov al, caracter
    mov ah, 09h ;imprimir un char con color
    mov bh, 0
    mov bl, color ;aplica el color al char
    mov cx, 1
    int 10h

    ;incrementa en 1 la columna para seguir imprimiendo sin sobreescribir
    mov ah, 03h ;obtengo la posicion actual del cursor
    int 10h
    inc dl ;incrementra la columna del cursor 
    ;inc dh ;incrementa la fila del cursor
    mov ah, 02h ;desplaza el cursor
    int 10h
endm

ImprimirNumero macro registro
    push ax
    push dx


    mov dl,registro
    ;ah = 2
    add dl,48
    mov ah,02h
    int 21h


    pop dx
    pop ax
endm

ImprimirNumero2Cifras macro registro
    local cualquiera,noz
    xor ax,ax
    mov al,registro
    mov cx,10
    mov bx,2
    cualquiera:
    xor dx,dx
    div cx
    push dx
    dec bx
    jnz cualquiera
    mov bx,2
    noz:
    pop dx
    ImprimirNumero dl
    dec bx
    jnz noz
endm

ImprimirNumero4Cifras macro registro
    local cualquiera,noz
    xor ax,ax
    mov ax,registro
    mov cx,10
    mov bx,4
    cualquiera:
    xor dx,dx
    div cx
    push dx
    dec bx
    jnz cualquiera
    mov bx,4
    noz:
    pop dx
    ImprimirNumero dl
    dec bx
    jnz noz
endm

mfecha macro
    imprimir10h f, 7,14d,29,11
    ;reposicionar puntero
    mov ah, 03h ;obtengo la posicion actual del cursor
    int 10h
    mov dl, 36;inc dl ;incrementra la columna del cursor 
    mov dh, 11 ;inc dh ;incrementa la fila del cursor
    mov ah, 02h ;desplaza el cursor
    int 10h

    mov ah, 2ah
    int 21h
    ImprimirNumero2Cifras dl
    imprimirChar "/", 15d
    mov ah, 2ah
    int 21h
    ImprimirNumero2Cifras dh
    imprimirChar "/", 15d
    mov ah, 2ah
    int 21h
    ImprimirNumero4Cifras cx
endm

mhora macro
    imprimir10h h, 5,14d,29,13
    ;reposicionar puntero
    mov ah, 03h ;obtengo la posicion actual del cursor
    int 10h
    mov dl, 36;inc dl ;incrementra la columna del cursor 
    mov dh, 13 ;inc dh ;incrementa la fila del cursor
    mov ah, 02h ;desplaza el cursor
    int 10h

    mov ah, 2ch
    int 21h
    ImprimirNumero2Cifras ch
    imprimirChar ":", 15d
    mov ah, 2ch
    int 21h
    ImprimirNumero2Cifras cl
    imprimirChar ":", 15d
    mov ah, 2ch
    int 21h
    ImprimirNumero2Cifras dh
endm