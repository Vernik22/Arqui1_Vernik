mContarTrip macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI
    reiniciarContadorTrip
    xor di, di
    xor si, si
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, "i"
        jz vocalA
        cmp bl, "u"
        jz vocalA
        cmp bl, 129
        jz vocalA

        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    vocalA:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz vocalI
        cmp bl, "e"
        jz vocalI
        cmp bl, "o"
        jz vocalI
        cmp bl, 160
        jz vocalI
        cmp bl, 130
        jz vocalI
        cmp bl, 162
        jz vocalI

        jmp aumRet


    vocalI:
        inc si
        mov bl, contenedor[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet


    aumentar:
        aumentarContadorTrip
        inc di
        inc di
        jmp aumRet


    fin:
        limpiarTerminal
        imprimir10h Ctriptongo, 9,14d,1,1
        imprimirChar 's',14d
        imprimirChar ':',14d
        imprimirChar '.',0d
        imprimir10h conteoTriptongos, 3, 2d,15, 1
        mov ah, 10h
        int 16h
endm


reiniciarContadorTrip macro
    mov conteoTriptongos[1], "0"
    mov conteoTriptongos[2], "0"
    
endm

aumentarContadorTrip macro
    local aumentarD, fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve ,diez, duno, ddos,dtres,dcuatro,dcinco,dseis,dsiete,docho,dnueve

    mov bl, conteoTriptongos[2]
    cmp bl, "0"
    jz uno
    cmp bl, "1"
    jz dos
    cmp bl, "2"
    jz tres
    cmp bl, "3"
    jz cuatro
    cmp bl, "4"
    jz cinco
    cmp bl, "5"
    jz seis
    cmp bl, "6"
    jz siete
    cmp bl, "7"
    jz ocho
    cmp bl, "8"
    jz nueve
    cmp bl, "9"
    jz diez

    uno:
    mov conteoTriptongos[2], "1"
    jmp fin
    dos:
    mov conteoTriptongos[2], "2"
    jmp fin
    tres:
    mov conteoTriptongos[2], "3"
    jmp fin
    cuatro:
    mov conteoTriptongos[2], "4"
    jmp fin
    cinco:
    mov conteoTriptongos[2], "5"
    jmp fin
    seis:
    mov conteoTriptongos[2], "6"
    jmp fin
    siete:
    mov conteoTriptongos[2], "7"
    jmp fin
    ocho:
    mov conteoTriptongos[2], "8"
    jmp fin
    nueve:
    mov conteoTriptongos[2], "9"
    jmp fin

    diez:
        mov bl, conteoTriptongos[1]
        cmp bl, "0"
        jz duno
        cmp bl, "1"
        jz ddos
        cmp bl, "2"
        jz dtres
        cmp bl, "3"
        jz dcuatro
        cmp bl, "4"
        jz dcinco
        cmp bl, "5"
        jz dseis
        cmp bl, "6"
        jz dsiete
        cmp bl, "7"
        jz docho
        cmp bl, "8"
        jz dnueve
        
        duno:
        mov conteoPalabras[1], "1"
        mov conteoPalabras[2], "0"
        jmp fin
        ddos:
        mov conteoPalabras[1], "2"
        mov conteoPalabras[2], "0"
        jmp fin
        dtres:
        mov conteoPalabras[1], "3"
        mov conteoPalabras[2], "0"
        jmp fin
        dcuatro:
        mov conteoPalabras[1], "4"
        mov conteoPalabras[2], "0"
        jmp fin
        dcinco:
        mov conteoPalabras[1], "5"
        mov conteoPalabras[2], "0"
        jmp fin
        dseis:
        mov conteoPalabras[1], "6"
        mov conteoPalabras[2], "0"
        jmp fin
        dsiete:
        mov conteoPalabras[1], "7"
        mov conteoPalabras[2], "0"
        jmp fin
        docho:
        mov conteoPalabras[1], "8"
        mov conteoPalabras[2], "0"
        jmp fin
        dnueve:
        mov conteoPalabras[1], "9"
        mov conteoPalabras[2], "0"
        jmp fin
    
    fin:
endm

mPropTrip macro
    local fin
    mmcontpalabra
    mmptrip
    push ax
    push bx

    mov ax, dConteotTriptongos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropTrip, al

    limpiarTerminal
    mov ah, 03h ;obtengo la posicion actual del cursor
    int 10h
    inc dl ;incrementra la columna del cursor 
    inc dh ;incrementa la fila del cursor
    mov ah, 02h ;desplaza el cursor
    int 10h
    imprimirChar 'P',12d
    imprimirChar 'R',12d
    imprimirChar 'O',12d
    imprimirChar 'P',12d
    imprimirChar '_',12d
    imprimir10h Ctriptongo, 9,12d,6,1
    imprimirChar 's',12d
    imprimirChar ':',14d
    imprimirChar '.',0d
    ImprimirNumero2Cifras dPropTrip
    imprimirChar '%',12d
    mov ah, 10h
    int 16h
    
    
    fin:
        pop bx
        pop ax
endm

mmptrip macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI
    mov dConteotTriptongos, 0
    xor di, di
    xor si, si
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, "i"
        jz vocalA
        cmp bl, "u"
        jz vocalA
        cmp bl, 129
        jz vocalA

        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    vocalA:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz vocalI
        cmp bl, "e"
        jz vocalI
        cmp bl, "o"
        jz vocalI
        cmp bl, 160
        jz vocalI
        cmp bl, 130
        jz vocalI
        cmp bl, 162
        jz vocalI

        jmp aumRet


    vocalI:
        inc si
        mov bl, contenedor[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet


    aumentar:
        inc dConteotTriptongos
        inc di
        inc di
        jmp aumRet


    fin:
endm

mCtrip macro 
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, noEs
    xor di, di
    xor si, si
    mov di, 10d
    cicloA:
        mov bl, bufferTeclado[di]
        cmp bl, "$"
        jz noEs
        cmp bl, "i"
        jz vocalA
        cmp bl, "u"
        jz vocalA
        cmp bl, 129
        jz vocalA

        aumRet:
        inc di
        cmp di, 50d
        jnz cicloA
        jmp noEs

    vocalA:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "a"
        jz vocalI
        cmp bl, "e"
        jz vocalI
        cmp bl, "o"
        jz vocalI
        cmp bl, 160
        jz vocalI
        cmp bl, 130
        jz vocalI
        cmp bl, 162
        jz vocalI

        jmp aumRet


    vocalI:
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet


    aumentar:
        imprimir10h siEsTrip, 15,14d,0,9
        jmp fin

    noEs:
        mov ah, 03h ;obtengo la posicion actual del cursor
        int 10h
        mov dl, 0
        mov dh, 9
        ;inc dl ;incrementra la columna del cursor 
        ;inc dh ;incrementa la fila del cursor
        mov ah, 02h ;desplaza el cursor
        int 10h
        imprimirChar 'N',14d
        imprimirChar 'o',14d
        imprimirChar '.',0d
        imprimirChar 'e',14d
        imprimirChar 's',14d
        imprimir10h Ctriptongo, 9,14d,6,9
    fin:
        mov ah, 10h
        int 16h

endm

reporteTriptongo macro
    repTrip
    WriteFile handle,saltoL,1
    WriteFile handle,Ctriptongo,9
    WriteFile handle,saltoL,1
    WriteFile handle,Cpr,5
    Escribir8bits dPropTrip
    EscribirChar "%"
    WriteFile handle,saltoL,1
    WriteFile handle,cantidadP,10
    mov bx, dConteotTriptongos
    Escribir8bits bl
    WriteFile handle,saltoL,1
endm

repTrip macro
    local fin
    mmcontpalabra
    mmptrip
    push ax
    push bx

    mov ax, dConteotTriptongos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropTrip, al
    
    
    fin:
        pop bx
        pop ax
endm

pintarTriptongo macro 
    local  fin, ciclo,aumentar, vocalA, vocalI
    xor di, di
    ciclo:
        mov bl, contenedor[si] 
        cmp bl, "i"
        jz vocalA
        cmp bl, "u"
        jz vocalA
        cmp bl, 129
        jz vocalA

        jmp fin

    vocalA:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, "a"
        jz vocalI
        cmp bl, "e"
        jz vocalI
        cmp bl, "o"
        jz vocalI
        cmp bl, 160
        jz vocalI
        cmp bl, 130
        jz vocalI
        cmp bl, 162
        jz vocalI

        jmp fin

        

    vocalI:
        inc di
        mov bl, contenedor[di]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar


        jmp fin

    

    aumentar:
        mov bl, contenedor[si] 
        imprimirChar bl, 01001110b
        inc si
        mov bl, contenedor[si] 
        imprimirChar bl, 01001110b
        inc si
        mov bl, contenedor[si] 
        imprimirChar bl, 01001110b
        mov banderaPinto, 1d
       
    fin:
endm