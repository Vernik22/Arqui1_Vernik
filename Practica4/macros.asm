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

imprimir macro cadena, color 
    
    mov ah, 09h
    mov bl, color
    mov cx, lengthof cadena - 1
    int 10h ;color al texto
    lea dx, cadena
    int 21h ;print
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

encabezado macro
    imprimir10h uni, 38,15d,0,0
    imprimir10h curso, 46,15d,0,1
    imprimir10h nombre, 45,15d,0,2
    imprimir10h practica, 10,15d,0,3
    imprimir10h msalir, 24,15d,0,4
    ;lea bp, uni
   ; mov al, 1
    ;mov bh, 0
   ; mov bl, 15d ; 15d blanco , 2h verde
    ;mov cx, 38
   ; mov dl, 0 ;columna
   ; mov dh, 0 ;fila
   ; mov ah, 13h ;funcionalidad escribir string/cadena
   ; int 10h
    
    ;imprimir uni, 15d
    ;imprimir salto, 0d
    ;imprimir curso, 15d
    ;imprimir salto, 0d
    ;imprimir nombre, 15d
    ;imprimir salto, 0d
    ;imprimir practica, 15d
    ;imprimir salto, 0d
    ;imprimir msalir, 15d
    ;imprimir salto, 0d
    ;imprimir salto, 0d
endm

limpiarTerminal macro  ;clear
    mov ax, 03h
    int 10h
endm  

Escribir8bits macro registro
    local cualquiera,noz
    xor ax,ax
    mov al,registro
    mov cx,10
    mov bx,3
    cualquiera:
    xor dx,dx
    div cx
    push dx
    dec bx
    jnz cualquiera
    mov bx,3
    noz:
    pop dx


    push ax
    push bx
    push cx
    push dx
    
    add dl,48
    mov param,dl
    WriteFile handle,param,1
    
    pop dx
    pop cx
    pop bx
    pop ax

    
    
    dec bx
    jnz noz
endm

EscribirChar macro registro
    xor ax,ax
    mov param, 0
    mov al,registro


    push ax
    push bx
    push cx
    push dx
    
    ;add dl,48
    mov param,al
    WriteFile handle,param,1
    
    pop dx
    pop cx
    pop bx
    pop ax
endm
crearReporte macro
    local ciclo, fin, error, exito
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Crepo[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 7d
        jnz ciclo

    createFile input,handle
    OpenFile input,handle
    reporteDiptongo
    reporteHiato
    reporteTriptongo
    reportePalabra
    ;WriteFile handle,salvarPalabra,12
    CloseFile handle
    jmp exito


    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin

    exito:
        limpiarTerminal
        imprimir10h Crepo, 7,14d,1,1
        imprimirChar '.',0d
        imprimirChar 'C',14d
        imprimirChar 'r',14d
        imprimirChar 'e',14d
        imprimirChar 'a',14d
        imprimirChar 'd',14d
        imprimirChar 'o',14d
        mov ah, 10h
        int 16h

    fin:

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

comandosPractica macro
    local inicio, fin,abrir, contar, prop, colorear, reporte, dip, hia, trip
    inicio:
        mov bl, bufferTeclado[0]
        cmp bl, "a"
        jz abrir

        cmp bl, "c"
        jz contar

        cmp bl, "p"
        jz prop
        cmp bl, "r"
        jz reporte
        cmp bl, "d"
        jz dip
        cmp bl, "h"
        jz hia
        cmp bl, "t"
        jz trip
        jmp fin

    abrir:
        abrirArchivo
        jmp fin
    contar:
        mov bl, bufferTeclado[2]
        cmp bl, "l"
        jz colorear

        contarComando
        jmp fin

    prop:
        propComando
        jmp fin

    colorear:
        colorearComando
        jmp fin
    reporte:
        crearReporte
        jmp fin

    dip:
        dipComando
        jmp fin

    hia:
        hiComando
        jmp fin

    trip:
        tripComando

    fin:

endm

abrirArchivo macro
    local ciclo, fin, error, abrirF, cicloA
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Cab[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 5d
        jnz ciclo

        xor di, di
        mov di, 6d
        xor si, si
        cicloA:
            mov bl, bufferTeclado[di]
            cmp bl, "$"
            jz abrirF
            mov nArchivoAbrir[si], bl
            inc si
            inc di
            cmp di, 22d
            jnz cicloA
            jmp abrirF

    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin        

    abrirF:
        OpenFile nArchivoAbrir,handle 
        ReadFile handle, contenedor, 1850
        CloseFile handle

        limpiarTerminal
        imprimir10h mensajeExito, 35,2d,0,0
        mov ah, 10h
        int 16h


    fin:

endm

contarComando macro
    local ciclo, fin, error, contar, cicloA, cicloB, cicloC, cicloD, contarDip, contarTrip, contarHi, contarPal
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Ccont[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 6d
        jnz ciclo

    xor di, di
    mov di, 7d
    xor si, si

    mov bl, bufferTeclado[di]
    cmp bl, "d"
    jz cicloA

    cmp bl, "t"
    jz cicloC

    cmp bl, "p"
    jz cicloD
    cmp bl, "h"
    jz cicloB

    jmp error
    cicloA:
        mov bl, bufferTeclado[di]
        mov cl, Cdiptongo[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 8d
        jnz cicloA

        jmp contarDip

    cicloB:
        mov bl, bufferTeclado[di]
        mov cl, Chiato[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 5d
        jnz cicloB

        jmp contarHi
    cicloC:
        mov bl, bufferTeclado[di]
        mov cl, Ctriptongo[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 9d
        jnz cicloC

        jmp contarTrip
    cicloD:
        mov bl, bufferTeclado[di]
        mov cl, Cpalabra[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 7d
        jnz cicloD

        jmp contarPal

    jmp fin
    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 

    contarDip:
        mContarDip
        jmp fin
    contarHi:
        mContarHi
        jmp fin
    contarTrip:
        mContarTrip
        jmp fin

    contarPal:
        mContarPalabras


    fin:
endm

propComando macro
    local ciclo, fin, error, cicloA, cicloC, cicloB, propDip, propHi, propTrip
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Cpr[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 4d
        jnz ciclo

    xor di, di
    mov di, 5d
    xor si, si

    mov bl, bufferTeclado[di]
    cmp bl, "d"
    jz cicloA

    cmp bl, "t"
    jz cicloC

    cmp bl, "h"
    jz cicloB

    jmp error

    cicloA:
        mov bl, bufferTeclado[di]
        mov cl, Cdiptongo[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 8d
        jnz cicloA

        jmp propDip

    cicloB:
        mov bl, bufferTeclado[di]
        mov cl, Chiato[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 5d
        jnz cicloB

        jmp propHi
    cicloC:
        mov bl, bufferTeclado[di]
        mov cl, Ctriptongo[si]
        cmp bl, cl
        jnz error
        inc si
        inc di
        cmp si, 9d
        jnz cicloC

        jmp propTrip

    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 
        
    propDip:
        mPropDip
        jmp fin
    propHi:
        mPropHi
        jmp fin
    propTrip:
        mPropTrip
        jmp fin

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

dipComando macro
    local ciclo, fin, error, propDip
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Cdiptongo[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 8d
        jnz ciclo

        jmp propDip
    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 

    propDip:
        mCdip
        jmp fin

    fin:
endm

hiComando macro
    local ciclo, fin, error, propHi
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Chiato[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 5d
        jnz ciclo

        jmp propHi
    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 

    propHi:
        mChi
        jmp fin

    fin:
endm

tripComando macro 
    local ciclo, fin, error, propHi
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Ctriptongo[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 9d
        jnz ciclo

        jmp propHi
    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 

    propHi:
        mCtrip
        jmp fin

    fin:

endm

colorearComando macro
    local ciclo, fin, error, propHi
    xor di, di
    ciclo: 
        mov bl, bufferTeclado[di]
        mov cl, Ccol[di]
        cmp bl, cl
        jnz error
        inc di
        cmp di, 8d
        jnz ciclo

        jmp propHi
    error:
        limpiarTerminal
        imprimir10h mensajeError, 28,13d,1,1
        mov ah, 10h
        int 16h
        jmp fin 

    propHi:
        mColorear
        jmp fin

    fin:
endm

mColorear macro 
    local contar, fin, agFila, elsse, imprimir, pa, pe, pi, po, pu, pn
    xor si,si
    limpiarTerminal 
  ;  contar:
  ;      mov bl, contenedor[si]
  ;      cmp bl, "$"
  ;      jz fin
  ;      inc si
  ;      cmp si, 1850
  ;      jz fin
  ;      jmp contar

    contar:
        mov bl, contenedor[si]
        cmp bl, "$"
        jz fin
        cmp bl, 13
        jz agFila

        jmp imprimir
        agFila:
            mov ah, 03h ;obtengo la posicion actual del cursor
            int 10h
            inc dh ;incrementa la fila del cursor
            mov dl,0
            ;inc dl ;incrementra la columna del cursor 
            ;inc dh ;incrementa la fila del cursor
            mov ah, 02h ;desplaza el cursor
            int 10h
            inc si
            jmp elsse
        imprimir:  
            cmp bl, "a"
            jz pa
            cmp bl, "e"
            jz pe
            cmp bl, "o"
            jz po
            cmp bl, "i"
            jz pi
            cmp bl, "u"
            jz pu 
            cmp bl, 161
            jz pi 
            cmp bl, 163
            jz pu 

            jmp pn
            ;imprimirChar bl, 15d
            ;pintarDiptongos

            pa:
                
                pintarDiptongos
                pintarHiato
                pintarTriptongo
                cmp banderaPinto, 1d
                jz elsse
                jmp pn
            pe:
                
                pintarDiptongos
                pintarHiato
                pintarTriptongo
                cmp banderaPinto, 1d
                jz elsse
                jmp pn
            pi:
                
                pintarDiptongos
                pintarHiato
                pintarTriptongo
                cmp banderaPinto, 1d
                jz elsse
                jmp pn
            po:
                
                pintarDiptongos
                pintarHiato
                pintarTriptongo
                cmp banderaPinto, 1d
                jz elsse
                jmp pn
            pu:
                
                pintarDiptongos
                pintarHiato
                pintarTriptongo
                cmp banderaPinto, 1d
                jz elsse
                jmp pn
            pn:
                mov bl, contenedor[si]
                imprimirChar bl, 15d
        elsse:
            mov banderaPinto, 0d
            inc si
            cmp si, 1850
            jz fin
            jmp contar
    fin:
    ;limpiarTerminal 
    ;dec si
    ;imprimir10h contenedor, si,15d,0,0

    ;pintarDiptongos
    mov ah, 10h
    int 16h
endm