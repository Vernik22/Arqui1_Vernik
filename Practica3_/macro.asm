imprimir macro cadena, color 
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    mov bl, color
    mov cx, lengthof cadena - 1
    int 10h ;color al texto
    lea dx, cadena
    int 21h ;print
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

imprimirMatriz macro
    local ciclo, ciclo2, ciclo3, ciclo4, reinicio, reinicio2
    imprimir espacio, 0d ; color 0d es negro
    imprimir espacio, 0d 
    
    xor si, si
    ciclo:
        mov bl, cabecerasC[si]  
        mov individual[0], bl
        imprimir individual, 15d  ;15d es blanco
        imprimir espacio, 0d
        imprimir espacio, 0d
        imprimir espacio, 0d
        inc si
        cmp si, 8d
        jnz ciclo   
        
    imprimir salto, 0d
    xor si, si
    mov iteradorJ, 0d       
    
    ciclo2: ;ciclo que imprime las cabeceras de las filas
        mov bl,cabecerasF[si] 
        mov individual[0], bl
        imprimir individual, 15d
        imprimir espacio, 0d
        mov iteradorI, 0d
          
    ciclo3: ;ciclo que imprime los valores de las filas
        mov di, iteradorJ
        verificarValor tablero[di]
        inc iteradorJ
        imprimir individual, color 
        
        inc iteradorI ;validacion para hacer linea divisoria
        cmp iteradorI,8d
        jz reinicio
        
        imprimir espacio, 0d
        mov bl, lineas[0]
        mov individual[0], bl
        imprimir individual,15d  
        imprimir espacio, 0d
        jmp ciclo3
        
    reinicio: ;ciclo que imprime la linea divisoria entre filas
        cmp si, 7d ; 2d
        jz reinicio2
        mov iteradorI, 0d
        imprimir salto, 0d
        imprimir espacio, 0d
        imprimir espacio, 0d
        ciclo4:
            mov bl, lineas[1]
            mov individual[0],bl
            imprimir individual,15d
            inc iteradorI
            cmp iteradorI, 30d
            jnz ciclo4
            
    reinicio2:
        imprimir salto, 0d
        inc si
        cmp si,8d
        jnz ciclo2
                                
        
endm  
    
;d= decimal, h=hexadecimal, b= binario   

;row-major => [0,0,0
;              0,0,0] 

verificarValor macro valor
    local cero, uno, dos, fin, reina, reina2
    
    cmp valor, 0d
    jz cero
    
    cmp valor, 1d
    jz uno

    cmp valor, 3d
    jz reina 

    cmp valor, 4d
    jz reina2     

    dos:
        mov color,14d ;amarillo
        mov individual[0], "O"
        jmp fin
    
    uno:
        mov color, 11d; azul
        mov individual[0], "O"
        jmp fin   
        
    reina:
        mov color,12d ;rojo
        mov individual[0], "R"
        jmp fin

    reina2:
        mov color,10d ;verde
        mov individual[0], "R"
        jmp fin

    cero:
        mov color, 0d
        mov individual[0], " "
        
    fin:
        

endm   

obtenerIndice macro row, column
    ;posicion [i][j]  en el arreglo = i*numero columnas + j row-major
    mov ax, row
    mov bx, 8d
    mul bx   ;ax = ax* parametro
    add ax, column
    mov indice, ax
endm 

obtenerIndiceD macro row, column
    ;posicion [i][j]  en el arreglo = i*numero columnas + j row-major
    mov ax, row
    mov bx, 8d
    mul bx   ;ax = ax* parametro
    add ax, column
    mov destino, ax
endm 
obtenerIndiceT macro row, column
    ;posicion [i][j]  en el arreglo = i*numero columnas + j row-major
    mov ax, row
    mov bx, 8d
    mul bx   ;ax = ax* parametro
    add ax, column
    mov destinoT, ax
endm 

iniciarMatriz macro
    local  blancos, ne, fin, nee, blanc, llenarC


    xor di, di
    mov di, 0d
    llenarC:
        mov tablero[di], 0
        inc di
        cmp di, 64d
        jnz llenarC

    xor di, di
    mov fichasNegras, 0d
    mov fichasBlancas, 40d
    ne:
        mov di, fichasNegras
        mov tablero[di], 1d
        inc fichasNegras
        inc fichasNegras
        
        cmp fichasNegras, 8d
        jz nee

        cmp fichasNegras, 24d
        jz blancos;jz blancos
        jmp ne

    nee:
        inc fichasNegras
        mov di, fichasNegras
        mov tablero[di], 1d
        inc fichasNegras

        cmp fichasNegras, 16d
        jz ne
        jmp nee

    blancos:
        inc fichasBlancas
        mov di, fichasBlancas
        mov tablero[di], 2d
        inc fichasBlancas
        
        cmp fichasBlancas, 48d
        jz blanc

        cmp fichasBlancas, 64d
        jz fin;jz blancos
        jmp blancos

    blanc:
        mov di, fichasBlancas
        mov tablero[di], 2d
        inc fichasBlancas
        inc fichasBlancas

        cmp fichasBlancas, 56d
        jz blancos
        jmp blanc

    fin:
        
endm

leerNombreJ1 macro 

    mov ah, 3fh
    mov bx, 00
    mov cx, 10
    mov dx, offset[nameJugador1]
    int 21h

    imprimir salto, 0d
    mov ah, 09h
    lea dx, nameJugador1
    int 21h

    mov flagNameJugador1, 1d
endm
leerNombreJ2 macro 

    mov ah, 3fh
    mov bx, 00
    mov cx, 10
    mov dx, offset[nameJugador2]
    int 21h

    imprimir salto, 0d
    mov ah, 09h
    lea dx, nameJugador2
    int 21h

    mov flagNameJugador2, 1d
endm

leerComando macro nombre, colorJ, punteo
    local inicio, ciclo, asignar, repo, turnoDos, finRep, filas, finFilas, llenarC, fin, turnoUno

    xor di, di
    mov di, 0d
    llenarC:
        mov bufferTeclado[di], "$"
        inc di
        cmp di, 50d
        jnz llenarC

    inicio:
        imprimir turnoDe, 15d
        mov ah, 09h
        lea dx, nombre
        int 21h
        imprimir salto, 0d
        imprimir colorFichas, 15d
        imprimir colorJ, 15d
        imprimir salto, 0d
        imprimir punteos, 15d
        imprimir punteo, 15d
        imprimir salto, 0d
        imprimirMatriz 
        imprimir salto, 0d
        imprimir salto, 0d
        imprimir mensajeComan, 15d
        leerHastaEnter bufferTeclado
        xor di, di
        mov bl, bufferTeclado[0]

        cmp bl, "r"
        jz repo
        jmp asignar

    repo: 
        imprimir reporte, 15d

        createFile input,handle
        OpenFile input,handle
        WriteFile handle,iniHtml,12
        WriteFile handle,h1ini,4
        WriteFile handle,j1,11
        WriteFile handle,nameJugador1,10
        WriteFile handle,punteos,8
        WriteFile handle,punteoJ1,2
        WriteFile handle,saltoHtml,4
        WriteFile handle,j2,11
        WriteFile handle,nameJugador2,10
        WriteFile handle,punteos,8
        WriteFile handle,punteoJ2,2
        WriteFile handle,saltoHtml,4
        WriteFile handle,h1fin,5
        WriteFile handle,tabIni,84

        WriteFile handle,trIni,17
        xor si, si
        xor di, di
        ciclo:

            verificarValorHtml tablero[si]

            inc di
            cmp di, 8d
            jnz finFilas

            filas: 
                WriteFile handle,trFin,5
                WriteFile handle,trIni,17
                xor di, di

            finFilas:

            inc si
            cmp si, 64d
            jnz ciclo

        WriteFile handle,trFin,5
        WriteFile handle,tabFin,8
        WriteFile handle,finHtml,14
        CloseFile handle
        cmp turnoJuego, 1d
        jz turnoDos
        mov turnoJuego, 1d
        jmp finRep
        turnoDos:
            mov turnoJuego, 2d
            jmp finRep

        finRep:
        mov ah, 10h
        int 16h
        jmp fin


    asignar:
        cmp turnoJuego, 2d
        jz turnoUno

        turnoJugador2
        jmp fin

        turnoUno:
            turnoJugador1

    fin:
        validarPunteo
endm

validarPunteo macro 
    local punteoJugador1, decimas1,punteoJugador2, fin, decimas2

    punteoJugador1:
        cmp punteoJ1[0], "1"
        jnz punteoJugador2  
        decimas1:
            cmp punteoJ1[1], "2"
            jnz punteoJugador2
            mov jugador1w, 1d
            mov banderaGanador, 1d
            jmp fin
    punteoJugador2:
        cmp punteoJ2[0], "1"
        jnz fin  
        decimas2:
            cmp punteoJ2[1], "2"
            jnz fin
            mov jugador2w, 1d
            mov banderaGanador, 1d
            jmp fin
        
    fin:
endm

turnoJugador1 macro
    local oIndice, fin, turnoDos, asignarC, oFila, mError, asignarF, asignarCD, asignarFD, oColD, oFilaD
    ;fichas azules osea el 1d
    xor di, di
    mov bl, bufferTeclado[0]
    oIndice:
        cmp cabecerasC[di], bl
        jz asignarC
        inc di
        cmp di, 8d
        jnz oIndice
        jmp mError
    oFila:
        cmp cabecerasF[di], bl
        jz asignarF
        inc di
        cmp di,8d
        jnz oFila
        jmp mError

    oColD:
        cmp cabecerasC[di], bl
        jz asignarCD
        inc di
        cmp di, 8d
        jnz oColD
        jmp mError
    oFilaD:
        cmp cabecerasF[di], bl
        jz asignarFD
        inc di
        cmp di,8d
        jnz oFilaD
            
    
    mError:
        imprimir errorCol, 15d
        cmp turnoJuego, 1d
        jz turnoDos
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDos:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin


   asignarC:
        mov columna, di
        xor di, di
        mov bl, bufferTeclado[1]
        jmp oFila

   asignarF:
        mov fila, di
        xor di, di
        obtenerIndice fila, columna
        mov bl, bufferTeclado[3]
        jmp oColD
        ;mov si, indice
        ;mov tablero[si], 0d

    asignarCD:
        mov columnaD, di
        xor di, di
        mov bl, bufferTeclado[4]
        jmp oFilaD

    asignarFD:
        mov filaD, di
        xor di, di
        obtenerIndiceD filaD, columnaD
        movimientoJ1

    fin:
endm

movimientoJ1 macro
    local mError,fin,moto, turnoDos, moto1, comer, reina, reinaComer,mErrorAtras, turnoDosA, aumentarT, aumentarTR, aumentarFR
    xor si,si
    mov si, indice
    cmp tablero[si], 1d
    jz moto
    cmp tablero[si], 3d
    jz reina
    jmp mError

    moto:
        xor si, si
        mov si, destino
        cmp tablero[si], 0d
        jz moto1
        cmp tablero[si], 2d
        jz comer
        cmp tablero[si], 4d
        jz comer
        jmp mError
        moto1:
            xor si, si
            xor di, di
            mov si, indice
            mov di, destino
            cmp di, si
            jl mErrorAtras

            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 1d
            ;verificar si esta en la ultima linea para convertirse en reina
            xor si, si
            mov si,filaD
            cmp si, 7d
            jnz fin
            mov si,destino
            mov tablero[si], 3d
            jmp fin

        reina:
            xor si, si
            mov si, destino
            cmp tablero[si], 0d
            jnz reinaComer
            
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 3d
            jmp fin   

        reinaComer:
            xor si, si
            xor di, di
            mov si, columna
            mov di, columnaD
            cmp si, di
            jl aumentarTR  ; falsta revisar

            cmp di, 0d
            jz mError
            dec di
            mov columnaT, di
            xor di,di
            mov si, fila
            mov di, filaD
            cmp si, di
            jl aumentarFR

            cmp di, 1d
            jz mError
            dec di
            mov filaT, di
            obtenerIndiceT filaT, columnaT
            mov si, destinoT
            cmp tablero[si], 0d
            jnz mError
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 0d
            xor si, si
            mov si, destinoT
            mov tablero[si], 3d
            aumentarPunteoJ punteoJ1
            jmp fin

            aumentarFR:

                cmp di, 1d
                jz mError
                inc di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 3d
                aumentarPunteoJ punteoJ1
                jmp fin

            aumentarTR:
                cmp di, 0d
                jz mError
                inc di
                mov columnaT, di
                xor di,di
                mov si, fila
                mov di, filaD
                cmp si, di
                jl aumentarFR

                cmp di, 1d
                jz mError
                dec di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 3d
                aumentarPunteoJ punteoJ1
                jmp fin
        comer:
            xor si, si
            xor di, di
            mov si, indice
            mov di, destino
            cmp di, si
            jl mErrorAtras

            xor si, si
            xor di, di
            mov si, columna
            mov di, columnaD
            cmp si, di
            jl aumentarT

            ;disminuir 1 
            ;cmp di, 1d 
            ;jz mError
            cmp di, 0d
            jz mError
            dec di
            mov columnaT, di
            xor di,di
            mov di, filaD
            inc di
            mov filaT, di
            obtenerIndiceT filaT, columnaT
            mov si, destinoT
            cmp tablero[si], 0d
            jnz mError
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 0d
            xor si, si
            mov si, destinoT
            mov tablero[si], 1d

            aumentarPunteoJ punteoJ1

            xor si, si
            mov si,filaT
            cmp si, 7d
            jnz fin
            mov si, destinoT
            mov tablero[si], 3d
            jmp fin
            

            aumentarT: ;aumentar 1 
                ;cmp di, 6d 
                ;jz mError
                cmp di, 7d
                jz mError
                inc di
                mov columnaT, di
                xor di,di
                mov di, filaD
                inc di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 1d
                aumentarPunteoJ punteoJ1
                xor si, si
                mov si,filaT
                cmp si, 7d
                jnz fin
                mov si, destinoT
                mov tablero[si], 3d
                jmp fin
            
        
    mError:
        imprimir errorFicha, 15d
        cmp turnoJuego, 1d
        jz turnoDos
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDos:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin

    mErrorAtras:
        imprimir errorAtras, 15d
        cmp turnoJuego, 1d
        jz turnoDosA
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDosA:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin
    
    fin:
endm

aumentarPunteoJ macro punteo
    local aumentarD, fin, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve ,diez

    mov bl, punteo[1]
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
    mov punteo[1], "1"
    jmp fin
    dos:
    mov punteo[1], "2"
    jmp fin
    tres:
    mov punteo[1], "3"
    jmp fin
    cuatro:
    mov punteo[1], "4"
    jmp fin
    cinco:
    mov punteo[1], "5"
    jmp fin
    seis:
    mov punteo[1], "6"
    jmp fin
    siete:
    mov punteo[1], "7"
    jmp fin
    ocho:
    mov punteo[1], "8"
    jmp fin
    nueve:
    mov punteo[1], "9"
    jmp fin
    diez:
    mov punteo[0], "1"
    mov punteo[1], "0"
    fin:

endm

turnoJugador2 macro
local oIndice, fin, turnoDos, asignarC, oFila, mError, asignarF, asignarCD, asignarFD, oColD, oFilaD
    ;fichas azules osea el 1d
    xor di, di
    mov bl, bufferTeclado[0]
    oIndice:
        cmp cabecerasC[di], bl
        jz asignarC
        inc di
        cmp di, 8d
        jnz oIndice
        jmp mError
    oFila:
        cmp cabecerasF[di], bl
        jz asignarF
        inc di
        cmp di,8d
        jnz oFila
        jmp mError

    oColD:
        cmp cabecerasC[di], bl
        jz asignarCD
        inc di
        cmp di, 8d
        jnz oColD
        jmp mError
    oFilaD:
        cmp cabecerasF[di], bl
        jz asignarFD
        inc di
        cmp di,8d
        jnz oFilaD
            
    
    mError:
        imprimir errorCol, 15d
        cmp turnoJuego, 1d
        jz turnoDos
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDos:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin


   asignarC:
        mov columna, di
        xor di, di
        mov bl, bufferTeclado[1]
        jmp oFila

   asignarF:
        mov fila, di
        xor di, di
        obtenerIndice fila, columna
        mov bl, bufferTeclado[3]
        jmp oColD

    asignarCD:
        mov columnaD, di
        xor di, di
        mov bl, bufferTeclado[4]
        jmp oFilaD

    asignarFD:
        mov filaD, di
        xor di, di
        obtenerIndiceD filaD, columnaD
        movimientoJ2

    fin:
endm

movimientoJ2 macro
    local mError,fin,moto, turnoDos, moto1, comer, reina, reinaComer,mErrorAtras, turnoDosA, aumentarT, aumentarFR, aumentarTR
    xor si,si
    mov si, indice
    cmp tablero[si], 2d
    jz moto
    cmp tablero[si], 4d
    jz reina
    jmp mError
    moto:
        xor si, si
        mov si, destino
        cmp tablero[si], 0d
        jz moto1
        cmp tablero[si], 1d
        jz comer
        cmp tablero[si], 3d
        jz comer
        jmp mError
        moto1:
            xor si, si
            xor di, di
            mov si, indice
            mov di, destino
            cmp di, si
            jg mErrorAtras

            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 2d
            xor si, si
            mov si,filaD
            cmp si, 0d
            jnz fin
            mov si, destino
            mov tablero[si], 4d
            jmp fin

        reina:
            xor si, si
            mov si, destino
            cmp tablero[si], 0d
            jnz reinaComer
            
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 4d
            jmp fin   

        reinaComer:
            xor si, si
            xor di, di
            mov si, columna
            mov di, columnaD
            cmp si, di
            jl aumentarTR  ; falsta revisar

            cmp di, 0d
            jz mError
            dec di
            mov columnaT, di
            xor di,di
            mov si, fila
            mov di, filaD
            cmp si, di
            jl aumentarFR

            cmp di, 1d
            jz mError
            dec di
            mov filaT, di
            obtenerIndiceT filaT, columnaT
            mov si, destinoT
            cmp tablero[si], 0d
            jnz mError
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 0d
            xor si, si
            mov si, destinoT
            mov tablero[si], 4d
            aumentarPunteoJ punteoJ2
            jmp fin

            aumentarFR:

                cmp di, 1d
                jz mError
                inc di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 4d
                aumentarPunteoJ punteoJ2
                jmp fin

            aumentarTR:
                cmp di, 0d
                jz mError
                inc di
                mov columnaT, di
                xor di,di
                mov si, fila
                mov di, filaD
                cmp si, di
                jl aumentarFR

                cmp di, 1d
                jz mError
                dec di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 4d
                aumentarPunteoJ punteoJ2
                jmp fin
        comer:
            xor si, si
            xor di, di
            mov si, indice
            mov di, destino
            cmp di, si
            jg mErrorAtras

            xor si, si
            xor di, di
            mov si, columna
            mov di, columnaD
            cmp si, di
            jl aumentarT

            ;disminuir 1 
            ;cmp di, 1d 
            ;jz mError
            cmp di, 0d
            jz mError
            dec di
            mov columnaT, di
            xor di,di
            mov di, filaD
            dec di
            mov filaT, di
            obtenerIndiceT filaT, columnaT
            mov si, destinoT
            cmp tablero[si], 0d
            jnz mError
            xor si, si
            mov si, indice
            mov tablero[si], 0d
            xor si, si
            mov si,destino
            mov tablero[si], 0d
            xor si, si
            mov si, destinoT
            mov tablero[si], 2d
            aumentarPunteoJ punteoJ2
            xor si, si
            mov si,filaT
            cmp si, 0d
            jnz fin
            mov si, destinoT
            mov tablero[si], 4d
            jmp fin

            aumentarT: ;aumentar 1 
                ;cmp di, 6d 
                ;jz mError
                cmp di, 7d
                jz mError
                inc di
                mov columnaT, di
                xor di,di
                mov di, filaD
                dec di
                mov filaT, di
                obtenerIndiceT filaT, columnaT
                mov si, destinoT
                cmp tablero[si], 0d
                jnz mError
                xor si, si
                mov si, indice
                mov tablero[si], 0d
                xor si, si
                mov si,destino
                mov tablero[si], 0d
                xor si, si
                mov si, destinoT
                mov tablero[si], 2d
                aumentarPunteoJ punteoJ2
                xor si, si
                mov si,filaT
                cmp si, 0d
                jnz fin
                mov si, destinoT
                mov tablero[si], 4d
                jmp fin
            
        
    mError:
        imprimir errorFicha, 15d
        cmp turnoJuego, 1d
        jz turnoDos
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDos:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin

    mErrorAtras:
        imprimir errorAtras, 15d
        cmp turnoJuego, 1d
        jz turnoDosA
        mov turnoJuego, 1d
        mov ah, 10h
        int 16h
        jmp fin
        turnoDosA:
            mov turnoJuego, 2d
            
        mov ah, 10h
        int 16h
        jmp fin
    
    fin:

endm

verificarValorHtml macro valor
    local cero, uno, dos, fin, reina
    
    cmp valor, 0d
    jz cero
    
    cmp valor, 1d
    jz uno

    cmp valor, 3d
    jz reina    

    dos:
        WriteFile handle,Tamarillo,37
        jmp fin
    
    uno:
        WriteFile handle,Tazul,37
        jmp fin   
        
    reina:
        WriteFile handle,Trojo,37
        jmp fin

    cero:
        WriteFile handle,Tcero,37
        
    fin:
        

endm   

;============= Abrir archivo===========================
OpenFile macro buffer,handler
    local erro,fini
    mov AX,@data
    mov DS,AX
    mov ah,3dh
    mov al,02h
    lea dx,buffer
    int 21h
    ;jc Erro ; db con mensaje que debe existir en doc maestro
    mov handler,ax
    mov ax,0
    ;jmp fini
    erro:
    ;Print TItuloErrorArchivo
    mov ax,1
    fini:
endm
;============== MACRO CERRAR ARCHIVO==============
CloseFile macro handler
;mov checkopenfile,1
    mov AX,@data
    mov DS,AX
    mov ah,3eh
    mov bx,handler
    int 21h
    ;jc Error2 ; db con mensaje que debe existir en doc maestro
endm

;=========== MACRO LEER ARCHIVO===========
ReadFile macro handler,buffer,numbytes
    mov AX,@data
    mov DS,AX
    mov ah,3fh
    mov bx,handler
    mov cx,numbytes ; numero maximo de bytes a leer(para proyectos hacerlo gigante) 
    lea dx,buffer
    int 21h
;jc Error4 ; db con mensaje que debe existir en doc maestro
endm

; pendiente el de crear escribir
;======================== MACRO CREAR ARCHIVO (any extension) ===================
CreateFile macro buffer,handler
    mov AX,@data
    mov DS,AX
    mov ah,3ch
    mov cx,00h
    lea dx,buffer
    int 21h
    ;jc Error4
    mov bx,ax
    mov ah,3eh
    int 21h
endm
; ========================= MACRO ESCRIBIR EN ARCHIVO YA CREADO =================

WriteFile macro handler,buffer,numbytes
    mov AX,@data
    mov DS,AX
    mov ah,40h
    mov bx,handler
    mov cx,numbytes
    lea dx, buffer
    int 21h
endm