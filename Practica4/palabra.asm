mContarPalabras macro
    local fin, cicloA, aumentar, aumRet
    reiniciarContadorP
    xor di, di
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, " "
        jz aumentar
        cmp bl, 13
        jz aumentar
        
        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    aumentar:
        aumentarContadorP
        jmp aumRet
    
    fin:
        aumentarContadorP
        limpiarTerminal
        imprimir10h Cpalabra, 7,14d,1,1
        imprimirChar 's',14d
        imprimirChar ':',14d
        imprimirChar '.',0d
        imprimir10h conteoPalabras, 3, 2d,13, 1
        ;ImprimirNumero dConteoPalabras
        mov ah, 10h
        int 16h
endm

aumentarContadorP macro
    local aumentarD, fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve ,diez, duno, ddos,dtres,dcuatro,dcinco,dseis,dsiete,docho,dnueve

    mov bl, conteoPalabras[2]
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
    mov conteoPalabras[2], "1"
    jmp fin
    dos:
    mov conteoPalabras[2], "2"
    jmp fin
    tres:
    mov conteoPalabras[2], "3"
    jmp fin
    cuatro:
    mov conteoPalabras[2], "4"
    jmp fin
    cinco:
    mov conteoPalabras[2], "5"
    jmp fin
    seis:
    mov conteoPalabras[2], "6"
    jmp fin
    siete:
    mov conteoPalabras[2], "7"
    jmp fin
    ocho:
    mov conteoPalabras[2], "8"
    jmp fin
    nueve:
    mov conteoPalabras[2], "9"
    jmp fin

    diez:
        mov bl, conteoPalabras[1]
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

reiniciarContadorP macro
    mov conteoPalabras[1], "0"
    mov conteoPalabras[2], "0"
    
endm

mmcontpalabra macro
    local fin, cicloA, aumentar, aumRet
    mov dConteoPalabras, 0
    xor di, di
    cicloA:
        mov bl, contenedor[di]
        cmp bl, "$"
        jz fin
        cmp bl, " "
        jz aumentar
        cmp bl, 13
        jz aumentar
        
        aumRet:
        inc di
        cmp di, 1850d
        jnz cicloA
        jmp fin

    aumentar:
        inc dConteoPalabras
        jmp aumRet
    
    fin:
        inc dConteoPalabras
endm

reportePalabra macro
    WriteFile handle,saltoL,1
    WriteFile handle,Cpalabra,7
    WriteFile handle,saltoL,1
    WriteFile handle,cantidadP,10
    mov bx, dConteoPalabras
    Escribir8bits bl
    WriteFile handle,saltoL,1
endm
