mContarHi macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU, aut, vocalAA, autI, vocalII, autU, vocalUU
    reiniciarContadorHi
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
        cmp bl, 161
        jz vocalI
        cmp bl, 163
        jz vocalI

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
        cmp bl, 161
        jz aumentar
        cmp bl, 163
        jz aumentar
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
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
        cmp bl, "i"
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
        cmp bl, "u"
        jz aumentar

        jmp aumRet 

    aumentar:
        aumentarContadorHi
        inc di
        jmp aumRet


    fin:
        limpiarTerminal
        imprimir10h Chiato, 5,14d,1,1
        imprimirChar 's',14d
        imprimirChar ':',14d
        imprimirChar '.',0d
        imprimir10h conteoHiatos, 3, 2d,11, 1
        mov ah, 10h
        int 16h
endm

reiniciarContadorHi macro
    mov conteoHiatos[1], "0"
    mov conteoHiatos[2], "0"
    
endm

aumentarContadorHi macro
    local aumentarD, fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve ,diez, duno, ddos,dtres,dcuatro,dcinco,dseis,dsiete,docho,dnueve

    mov bl, conteoHiatos[2]
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
    mov conteoHiatos[2], "1"
    jmp fin
    dos:
    mov conteoHiatos[2], "2"
    jmp fin
    tres:
    mov conteoHiatos[2], "3"
    jmp fin
    cuatro:
    mov conteoHiatos[2], "4"
    jmp fin
    cinco:
    mov conteoHiatos[2], "5"
    jmp fin
    seis:
    mov conteoHiatos[2], "6"
    jmp fin
    siete:
    mov conteoHiatos[2], "7"
    jmp fin
    ocho:
    mov conteoHiatos[2], "8"
    jmp fin
    nueve:
    mov conteoHiatos[2], "9"
    jmp fin

    diez:
        mov bl, conteoHiatos[1]
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
        mov conteoHiatos[1], "1"
        mov conteoHiatos[2], "0"
        jmp fin
        ddos:
        mov conteoHiatos[1], "2"
        mov conteoHiatos[2], "0"
        jmp fin
        dtres:
        mov conteoHiatos[1], "3"
        mov conteoHiatos[2], "0"
        jmp fin
        dcuatro:
        mov conteoHiatos[1], "4"
        mov conteoHiatos[2], "0"
        jmp fin
        dcinco:
        mov conteoHiatos[1], "5"
        mov conteoHiatos[2], "0"
        jmp fin
        dseis:
        mov conteoHiatos[1], "6"
        mov conteoHiatos[2], "0"
        jmp fin
        dsiete:
        mov conteoHiatos[1], "7"
        mov conteoHiatos[2], "0"
        jmp fin
        docho:
        mov conteoHiatos[1], "8"
        mov conteoHiatos[2], "0"
        jmp fin
        dnueve:
        mov conteoHiatos[1], "9"
        mov conteoHiatos[2], "0"
        jmp fin
    fin:
endm

mPropHi macro
    local fin
    mmcontpalabra
    mmphi
    push ax
    push bx

    mov ax, dConteoHiatos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropHiato, al

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
    imprimir10h Chiato, 5,12d,6,1
    imprimirChar 's',12d
    imprimirChar ':',14d
    imprimirChar '.',0d
    ImprimirNumero2Cifras dPropHiato
    imprimirChar '%',12d
    mov ah, 10h
    int 16h
    
    
    fin:
        pop bx
        pop ax
endm

mmphi macro
    
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU, aut, vocalAA, autI, vocalII, autU, vocalUU
    mov dConteoHiatos, 0
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
        cmp bl, 161
        jz vocalI
        cmp bl, 163
        jz vocalI

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
        cmp bl, 161
        jz aumentar
        cmp bl, 163
        jz aumentar
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
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
        cmp bl, "i"
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
        cmp bl, "u"
        jz aumentar

        jmp aumRet 

    aumentar:
        inc dConteoHiatos
        inc di
        jmp aumRet
       


    fin:
endm

mChi macro
    local fin, cicloA, aumentarA, aumRet, vocalA, vocalI, noEs, aumentarS, vocalU
    xor di, di
    xor si, si
    mov di, 6d
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
        cmp bl, 161
        jz vocalI
        cmp bl, 163
        jz vocalI

        aumRet:
        inc di
        cmp di, 50d
        jnz cicloA
        jmp noEs

    vocalA:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, 161
        jz aumentarA
        cmp bl, 163
        jz aumentarA
        cmp bl, "a"
        jz aumentarS
        cmp bl, "e"
        jz aumentarS
        cmp bl, "o"
        jz aumentarS

        jmp aumRet

    vocalU:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "u"
        jz aumentarS

        jmp aumRet 
    vocalI:
        mov si, di
        inc si
        mov bl, bufferTeclado[si]
        cmp bl, "a"
        jz aumentarA
        cmp bl, "e"
        jz aumentarA
        cmp bl, "o"
        jz aumentarA
        cmp bl, "i"
        jz aumentarS

        jmp aumRet


    aumentarA:
        imprimir10h siEsHi, 11,14d,0,9
        imprimir10h hiAce, 8,14d,0,10 
        jmp fin

    aumentarS:
        imprimir10h siEsHi, 11,14d,0,9
        imprimir10h hiSim, 6,14d,0,10 
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
        imprimir10h Chiato, 5,14d,6,9
    fin:
        mov ah, 10h
        int 16h
endm

reporteHiato macro
    repHi
    WriteFile handle,saltoL,1
    WriteFile handle,Chiato,5
    WriteFile handle,saltoL,1
    WriteFile handle,Cpr,5
    Escribir8bits dPropHiato
    EscribirChar "%"
    WriteFile handle,saltoL,1
    WriteFile handle,cantidadP,10
    mov bx, dConteoHiatos
    Escribir8bits bl
    WriteFile handle,saltoL,1

    escribirReporteHi
    WriteFile handle,saltoL,1
    WriteFile handle,saltoL,1
endm

repHi macro
    local fin
    mmcontpalabra
    mmphi
    push ax
    push bx

    mov ax, dConteoHiatos
    mov bx, 100
    mul bx

    mov bx, dConteoPalabras
    div bx

    mov dPropHiato, al
    
    
    fin:
        pop bx
        pop ax
endm

pintarHiato macro
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
        cmp bl, 161
        jz vocalI
        cmp bl, 163
        jz vocalI

        jmp fin

    vocalA:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, 161
        jz aumentar
        cmp bl, 163
        jz aumentar
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
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
        cmp bl, "i"
        jz aumentar

        jmp fin

    
    vocalU:
        mov di, si
        inc di
        mov bl, contenedor[di]
        cmp bl, "u"
        jz aumentar

        jmp fin 

    aumentar:
        mov bl, contenedor[si] 
        imprimirChar bl, 0100b
        inc si
        mov bl, contenedor[si] 
        imprimirChar bl, 0100b
        mov banderaPinto, 1d
       
    fin:
endm

escribirReporteHi macro
    local fin, cicloA, aumentar, aumRet, vocalA, vocalI, vocalU, aut, vocalAA, autI, vocalII, autU, vocalUU, cicloE, cicloEE, esC
    reiniciarContadorHi
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
        cmp bl, 161
        jz vocalI
        cmp bl, 163
        jz vocalI

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
        cmp bl, 161
        jz aumentar
        cmp bl, 163
        jz aumentar
        cmp bl, "a"
        jz aumentar
        cmp bl, "e"
        jz aumentar
        cmp bl, "o"
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
        cmp bl, "i"
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
        cmp bl, "u"
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