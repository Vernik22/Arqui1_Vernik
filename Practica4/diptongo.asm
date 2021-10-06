mContarDip macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU,  aut, vocalAA, autI, vocalII, autU, vocalUU
    reiniciarContadorDip
    xor di, di
    xor si, si
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, "a"
        jz vocalA
        cmp bl, "e"
        jz vocalA
        cmp bl, "o"
        jz vocalA
        cmp bl, "i"
        jz vocalI
        cmp bl, "u"
        jz vocalU

        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    vocalA:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalAA
        aut:
            inc di
            inc di 
            jmp aumRet

        vocalAA:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalI:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalII
        autI:
            inc di
            inc di 
            jmp aumRet

        vocalII:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalU:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalUU
        autU:
            inc di
            inc di 
            jmp aumRet

        vocalUU:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "i"
        jz aumentar

        jmp aumRet

    aumentar:
        aumentarContadorDip
        inc di
        jmp aumRet

    fin:
        limpiarTerminal
        imprimir10h Cdiptongo, 8,14d,1,1
        imprimirChar 's',14d
        imprimirChar ':',14d
        imprimirChar '.',0d
        imprimir10h conteoDiptongos, 3, 2d,14, 1
        mov ah, 10h
        int 16h

endm

reiniciarContadorDip macro
    mov conteoDiptongos[1], "0"
    mov conteoDiptongos[2], "0"
    
endm

aumentarContadorDip macro
    local aumentarD, fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve ,diez, duno, ddos,dtres,dcuatro,dcinco,dseis,dsiete,docho,dnueve

    mov bl, conteoDiptongos[2]
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
    mov conteoDiptongos[2], "1"
    jmp fin
    dos:
    mov conteoDiptongos[2], "2"
    jmp fin
    tres:
    mov conteoDiptongos[2], "3"
    jmp fin
    cuatro:
    mov conteoDiptongos[2], "4"
    jmp fin
    cinco:
    mov conteoDiptongos[2], "5"
    jmp fin
    seis:
    mov conteoDiptongos[2], "6"
    jmp fin
    siete:
    mov conteoDiptongos[2], "7"
    jmp fin
    ocho:
    mov conteoDiptongos[2], "8"
    jmp fin
    nueve:
    mov conteoDiptongos[2], "9"
    jmp fin

    diez:
        mov bl, conteoDiptongos[1]
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
        mov conteoDiptongos[1], "1"
        mov conteoDiptongos[2], "0"
        jmp fin
        ddos:
        mov conteoDiptongos[1], "2"
        mov conteoDiptongos[2], "0"
        jmp fin
        dtres:
        mov conteoDiptongos[1], "3"
        mov conteoDiptongos[2], "0"
        jmp fin
        dcuatro:
        mov conteoDiptongos[1], "4"
        mov conteoDiptongos[2], "0"
        jmp fin
        dcinco:
        mov conteoDiptongos[1], "5"
        mov conteoDiptongos[2], "0"
        jmp fin
        dseis:
        mov conteoDiptongos[1], "6"
        mov conteoDiptongos[2], "0"
        jmp fin
        dsiete:
        mov conteoDiptongos[1], "7"
        mov conteoDiptongos[2], "0"
        jmp fin
        docho:
        mov conteoDiptongos[1], "8"
        mov conteoDiptongos[2], "0"
        jmp fin
        dnueve:
        mov conteoDiptongos[1], "9"
        mov conteoDiptongos[2], "0"
        jmp fin
    
    fin:
endm

mPropDip macro
    local fin
    mmcontpalabra
    mmpdip
    push ax
    push bx

    mov ax, dConteoDiptongos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropDipt, al

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
    imprimir10h Cdiptongo, 8,12d,6,1
    imprimirChar 's',12d
    imprimirChar ':',14d
    imprimirChar '.',0d
    ImprimirNumero2Cifras dPropDipt
    imprimirChar '%',12d
    mov ah, 10h
    int 16h
    
    
    fin:
        pop bx
        pop ax

endm

mmpdip macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU,  aut, vocalAA, autI, vocalII, autU, vocalUU
    reiniciarContadorDip
    mov dConteoDiptongos, 0
    xor di, di
    xor si, si
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, "a"
        jz vocalA
        cmp bl, "e"
        jz vocalA
        cmp bl, "o"
        jz vocalA
        cmp bl, "i"
        jz vocalI
        cmp bl, "u"
        jz vocalU

        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    vocalA:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalAA
        aut:
            inc di
            inc di 
            jmp aumRet

        vocalAA:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalI:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalII
        autI:
            inc di
            inc di 
            jmp aumRet

        vocalII:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalU:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalUU
        autU:
            inc di
            inc di 
            jmp aumRet

        vocalUU:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "i"
        jz aumentar

        jmp aumRet

    aumentar:
        aumentarContadorDip
        inc dConteoDiptongos
        inc di
        jmp aumRet

    fin:
endm

mCdip macro
    local fin, cicloA, aumentarD, aumRet, vocalA, vocalI, vocalU, aumentarC, aumentarH, noEs
    xor di, di
    xor si, si
    mov di, 9d
    cicloA:
        mov bl, bufferTeclado[di]
        cmp bl, "$"
        jz noEs
        cmp bl, "a"
        jz vocalA
        cmp bl, "e"
        jz vocalA
        cmp bl, "o"
        jz vocalA
        cmp bl, "i"
        jz vocalI
        cmp bl, "u"
        jz vocalU

        aumRet:
        inc di
        cmp di, 50d
        jnz cicloA
        jmp noEs

    vocalA:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "i"
        jz aumentarD
        cmp bl, "u"
        jz aumentarD

        jmp aumRet

    vocalI:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "a"
        jz aumentarC
        cmp bl, "e"
        jz aumentarC
        cmp bl, "o"
        jz aumentarC
        cmp bl, "u"
        jz aumentarH

        jmp aumRet

    vocalU:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "a"
        jz aumentarC
        cmp bl, "e"
        jz aumentarC
        cmp bl, "o"
        jz aumentarC
        cmp bl, "i"
        jz aumentarH

        jmp aumRet

    aumentarD:
        imprimir10h siEsDip, 14,14d,0,9
        imprimir10h dipDec, 11,14d,0,10 
        
        jmp fin

    aumentarC:
        imprimir10h siEsDip, 14,14d,0,9
        imprimir10h dipCreciente, 9,14d,0,10 
        jmp fin
    aumentarH:
        imprimir10h siEsDip, 14,14d,0,9
        imprimir10h dipHom, 9,14d,0,10
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
        imprimir10h Cdiptongo, 8,14d,6,9
    fin:
        mov ah, 10h
        int 16h
endm

reporteDiptongo macro
    local ciclo, fin, escribir, aumRet, cicloA, vocalA, vocalI, vocalU, aumentar, aumRet1, cC
    repProp
    WriteFile handle,Cdiptongo,9
    WriteFile handle,saltoL,1
    WriteFile handle,Cpr,5
    Escribir8bits dPropDipt
    EscribirChar "%"
    WriteFile handle,saltoL,1
    WriteFile handle,cantidadP,10
    mov bx, dConteoDiptongos
    Escribir8bits bl
    WriteFile handle,saltoL,1

    escribirReporteDip
    WriteFile handle,saltoL,1
    WriteFile handle,saltoL,1

endm

repProp macro 
    local fin
    mmcontpalabra
    mmpdip
    push ax
    push bx

    mov ax, dConteoDiptongos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropDipt, al
    
    
    fin:
        pop bx
        pop ax
endm

resetSP macro
    local ciclo, fin
    xor si,si
    mov si, di
    ciclo:
        dec si
        dec posIni
        cmp posIni, 0
        jnz ciclo
        jmp fin
    fin:
endm

pintarDiptongos macro
    local  fin, ciclo,aumentar, vocalA, vocalI, vocalU
    xor di, di
    ciclo:
        mov di, si
        inc di
        inc di
        mov bl, contenedor[di]
        cmp bl, "a"
        jz fin
        cmp bl, "e"
        jz fin
        cmp bl, "o"
        jz fin
        cmp bl, "i"
        jz fin
        cmp bl, "u"
        jz fin

        mov bl, contenedor[si] 
        cmp bl, "a"
        jz vocalA
        cmp bl, "e"
        jz vocalA
        cmp bl, "o"
        jz vocalA
        cmp bl, "i"
        jz vocalI
        cmp bl, "u"
        jz vocalU

        jmp fin
    vocalA:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp fin

    vocalI:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp fin

    vocalU:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "i"
        jz aumentar

        jmp fin

    aumentar:
        mov bl, contenedor[si] 
        imprimirChar bl, 0010b
        inc si
        mov bl, contenedor[si] 
        imprimirChar bl, 0010b
        mov banderaPinto, 1d
       
    fin:
endm

escribirReporteDip macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU,  aut, vocalAA, autI, vocalII, autU, vocalUU, cicloE, cicloEE, esC
    xor di, di
    xor si, si
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, "a"
        jz vocalA
        cmp bl, "e"
        jz vocalA
        cmp bl, "o"
        jz vocalA
        cmp bl, "i"
        jz vocalI
        cmp bl, "u"
        jz vocalU

        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    vocalA:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalAA
        aut:
            inc di
            inc di 
            jmp aumRet

        vocalAA:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "i"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalI:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalII
        autI:
            inc di
            inc di 
            jmp aumRet

        vocalII:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "u"
        jz aumentar

        jmp aumRet

    vocalU:
        mov si, di
        inc si
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aut
        cmp bl, "e"
        jz aut
        cmp bl, "o"
        jz aut
        cmp bl, "i"
        jz aut
        cmp bl, "u"
        jz aut
        jmp vocalUU
        autU:
            inc di
            inc di 
            jmp aumRet

        vocalUU:
        mov si, di
        inc si
        mov bl, contenedor[si]
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
        jz aumentar
        cmp bl, "i"
        jz aumentar

        jmp aumRet

    aumentar:
        
        cicloE:
            mov bl, contenedor[si]
            inc si
            cmp bl, " "
            jnz cicloE

        cicloEE:
            mov bl, contenedor[di]
            dec di
            cmp bl, " "
            jnz cicloEE

        inc di
        inc di
        esC:
            mov bl, contenedor[di]
            cmp bl, "$"
            jz aumRet
            EscribirChar bl
            inc di
            cmp di, si
            jnz esC
        WriteFile handle,saltoL,1
        inc di
        jmp aumRet

    fin:

endm