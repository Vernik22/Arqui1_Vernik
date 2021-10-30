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


encabezado macro
    imprimir10h uni, 38,15d,0,0
    imprimir10h fac, 22,15d,0,1
    imprimir10h curso, 46,15d,0,2
    imprimir10h sem, 21,15d,0,3
    imprimir10h exam, 27,15d,0,4
    imprimir10h nombre, 45,15d,0,5
endm

limpiarTerminal macro  ;clear
    mov ax, 03h
    int 10h
endm  

leerHastaEnter macro entrada
    local salto, fin  
    
    xor bx,bx
    salto:
        mov ah,01h
        int 21h
        cmp al, 0dh ;compara si la entrada es un salto de linea
        je fin
        mov entrada[bx], al
        inc bx
        jmp salto
        
     fin:
        
endm

limpiarBuffer macro
    local llenarC
    xor di, di
    mov di, 0d
    llenarC:
        mov bufferTeclado[di], "$"
        inc di
        cmp di, 50d
        jnz llenarC
endm

convertirNumero macro
    local unidades, decenas, centenas, miles, fin, recorrer, retorno
    imprimir10h saltoL, 1, 0d,0,12
    xor di, di
    recorrer:
        cmp di, 0
        jz miles
        cmp di, 1
        jz centenas
        cmp di, 2
        jz decenas
        cmp di, 3
        jz unidades

        retorno:
        inc di
        cmp di, 4
        jz fin
        jmp recorrer



    
    unidades:
        mUnidades
        jmp retorno

    decenas:
        mDecenas
        jmp retorno

    centenas:
        mCentenas
        jmp retorno

    miles:
        mMiles
        jmp retorno

    fin:

    

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

mUnidades macro
 local fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
    
    mov bl, bufferTeclado[3]
        cmp bl, "0"
        jz fin
        cmp bl, "1"
        jz uno
        cmp bl, "2"
        jz dos
        cmp bl, "3"
        jz tres
        cmp bl, "4"
        jz cuatro
        cmp bl, "5"
        jz cinco
        cmp bl, "6"
        jz seis
        cmp bl, "7"
        jz siete
        cmp bl, "8"
        jz ocho
        cmp bl, "9"
        jz nueve

    jmp fin

    uno:
        imprimirChar "I", 15d
        jmp fin
    dos:
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        jmp fin
    tres:
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        jmp fin
    cuatro:
        imprimirChar "I", 15d
        imprimirChar "V", 15d
        jmp fin
    cinco:
        imprimirChar "V", 15d
        jmp fin
    seis:
        imprimirChar "V", 15d
        imprimirChar "I", 15d
        jmp fin
    siete:
        imprimirChar "V", 15d
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        jmp fin
    ocho:
        imprimirChar "V", 15d
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        imprimirChar "I", 15d
        jmp fin
    nueve:
        imprimirChar "I", 15d
        imprimirChar "X", 15d
    fin:

endm

mDecenas macro
 local fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
    
    mov bl, bufferTeclado[2]
        cmp bl, "0"
        jz fin
        cmp bl, "1"
        jz uno
        cmp bl, "2"
        jz dos
        cmp bl, "3"
        jz tres
        cmp bl, "4"
        jz cuatro
        cmp bl, "5"
        jz cinco
        cmp bl, "6"
        jz seis
        cmp bl, "7"
        jz siete
        cmp bl, "8"
        jz ocho
        cmp bl, "9"
        jz nueve

    jmp fin

    uno:
        imprimirChar "X", 15d
        jmp fin
    dos:
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        jmp fin
    tres:
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        jmp fin
    cuatro:
        imprimirChar "X", 15d
        imprimirChar "L", 15d
        jmp fin
    cinco:
        imprimirChar "L", 15d
        jmp fin
    seis:
        imprimirChar "L", 15d
        imprimirChar "X", 15d
        jmp fin
    siete:
        imprimirChar "L", 15d
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        jmp fin
    ocho:
        imprimirChar "L", 15d
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        imprimirChar "X", 15d
        jmp fin
    nueve:
        imprimirChar "X", 15d
        imprimirChar "C", 15d
    fin:

endm

mCentenas macro
 local fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
    
    mov bl, bufferTeclado[1]
        cmp bl, "0"
        jz fin
        cmp bl, "1"
        jz uno
        cmp bl, "2"
        jz dos
        cmp bl, "3"
        jz tres
        cmp bl, "4"
        jz cuatro
        cmp bl, "5"
        jz cinco
        cmp bl, "6"
        jz seis
        cmp bl, "7"
        jz siete
        cmp bl, "8"
        jz ocho
        cmp bl, "9"
        jz nueve

    jmp fin

    uno:
        imprimirChar "C", 15d
        jmp fin
    dos:
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        jmp fin
    tres:
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        jmp fin
    cuatro:
        imprimirChar "C", 15d
        imprimirChar "D", 15d
        jmp fin
    cinco:
        imprimirChar "D", 15d
        jmp fin
    seis:
        imprimirChar "D", 15d
        imprimirChar "C", 15d
        jmp fin
    siete:
        imprimirChar "D", 15d
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        jmp fin
    ocho:
        imprimirChar "D", 15d
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        imprimirChar "C", 15d
        jmp fin
    nueve:
        imprimirChar "C", 15d
        imprimirChar "M", 15d
    fin:

endm

mMiles macro
 local fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve
    
    mov bl, bufferTeclado[0]
        cmp bl, "0"
        jz fin
        cmp bl, "1"
        jz uno
        cmp bl, "2"
        jz dos
        cmp bl, "3"
        jz tres
        
        jmp fin


    uno:
        imprimirChar "M", 15d
        jmp fin
    dos:
        imprimirChar "M", 15d
        imprimirChar "M", 15d
        jmp fin
    tres:
        imprimirChar "M", 15d
        imprimirChar "M", 15d
        imprimirChar "M", 15d
    
    fin:

endm