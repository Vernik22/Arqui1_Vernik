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
    local cero, uno, dos, fin, reina
    
    cmp valor, 0d
    jz cero
    
    cmp valor, 1d
    jz uno

    cmp valor, 3d
    jz reina    

    dos:
        mov color,14d ;amarillo
        mov individual[0], "O"
        jmp fin
    
    uno:
        mov color, 11d; azul
        mov individual[0], "O"
        jmp fin   
        
    reina:
        mov color,4d ;rojo
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
    local inicio, ciclo, asignar, repo, turnoDos, finRep, filas, finFilas, llenarC

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
    
    asignar:

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