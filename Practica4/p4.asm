include macros.asm
include archivos.asm
include diptongo.asm
include hiato.asm
include palabra.asm
include trip.asm

.model small
.stack 100h
.data
    uni db "Universidad de San Carlos de Guatemala $"
    curso db "Arquitectura de Ensambladores y Computadores 1 $"
    nombre db "Vernik Carlos Alexander Yaxon Ortiz 201712057 $"
    practica db "Practica 4 $"
    msalir db "Ingrese x si desea salir $"
    iComand db "Ingrese el comando: $"
    bufferTeclado db 50 dup("$"),"$" 
    espacio db " $"
    salto db 0ah , "$"
    nPalabras db 0
    hiatos db 500 dup("$"),"$";Guardar Lectyra
    diptongos db 500 dup("$"),"$";Guardar Lectyra
    triptongos db 500 dup("$"),"$";Guardar Lectyra

    mensajeError db "Error, comando invalido.. !! $"
    mensajeExito db "Archivo abierto correctamente ... ! $"
    siEsDip db "Si es Diptongo  $"
    dipCreciente db "Creciente $"
    dipDec db "Decreciente $"
    dipHom db "Homogeneo $"
    siEsHi db "Si es Hiato $"
    hiAce db "Acentual $"
    hiSim db "Simple $"
    siEsTrip db "Si es Triptongo $"

    conteoPalabras db " 00$"
    dConteoPalabras dw 0
    conteoDiptongos db " 00$"
    dConteoDiptongos dw 0
    dPropDipt db 0
    conteoTriptongos db " 00$"
    dConteotTriptongos dw 0
    dPropTrip db 0
    conteoHiatos db " 00$"
    dConteoHiatos dw 0
    dPropHiato db 0

    posIni db 0
    posFinal dw 0
    posFila db 0d
    posCol db 0d
    banderaPinto db 0d

    ;Comandos :::::
    Cab db "abrir $"
    Ccont db "contar $"
    Cpr db "prop $"
    Ccol db "colorear $"
    Crepo db "reporte $"
    Cdiptongo db "diptongo $"
    Chiato db "hiato $"
    Ctriptongo db "triptongo $"
    Cpalabra db "palabra $"

    cantidadP db "Cantidad:  $"
    salvarPalabra db 12 dup(" "), "$"
    ;salvarPalabra db "helowssss   $"
    charr db " $"
    saltoL db 13
    param db 0
;para archivos ========================================
    input db "rep.txt",00h;Nombre
    contenedor db 1850 dup("$"),"$";Guardar Lectyra
    handle dw ?
    
    nArchivoAbrir db 25 dup(" "),00h


.code
    start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        main proc
            mov ah, 0 ;activa el modo video
            mov al, 03h ;tipo de modod de video modo texto es el 03h
            int 10h

            otra:
                limpiarBuffer
                limpiarTerminal
                encabezado
                imprimir10h iComand, 20,15d,0,6
                ;imprimirChar 'v',15d
                ;imprimirChar 'z',02h
                ;imprimir iComand, 15d
                leerHastaEnter bufferTeclado
                comandosPractica
                xor di, di
                mov bl, bufferTeclado[0]
                cmp bl, "x"
                jz salirJ
                jmp otra

            salirJ:
                .exit
        main endp
    end start