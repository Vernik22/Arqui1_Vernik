include macro.asm
  
.model small
.stack 100h
.data
    labJugador1 db "Ingrese nombre Jugador 1: ","$"
    labJugador2 db "Ingrese nombre Jugador 2: ","$" 
    nameJugador1 db 10 dup(" "),"$"
    nameJugador2 db 10 dup(" "),"$"
    tipoJugador1 db "azul$" ;1d
    tipoJugador2 db "amarillo$" ;2d
    flagNameJugador1 db 0
    flagNameJugador2 db 0  
    punteoJ1 db " 0$"
    punteoJ2 db " 0$"
    jugador1reina dw 0
    jugador2reina dw 0

    comandoMover db "     $"
    
    mensajeBienvenida db "Bienvenido..!!, Muestra Tablero Inicial","$"
    mensajeGanador db "El ganador es: $"
    mensajeComan db "Ingrese Comando: ","$"
    turnoDe db "Turno de: $"
    colorFichas db "Color Fichas: $"
    punteos db "Punteo: $"
    reporte db "Reporte Generado $"
    enterPC db "Presione enter para continuar...$"
    
    cabecerasC db "abcdefgh$"
    cabecerasF db "12345678$"
    individual db " $"
    valores db " XO$"
    lineas db "|-$"
    
    color db 0
    fila dw 0
    columna dw 0     
    iteradorI dw 0
    iteradorJ dw 0
    iteradorK dw 0
    banderaGanador db 0   
    indice dw 0
    posAnterior dw 0
    turnoJuego dw 1d ;tambien manejo el color de las weas

    fichasBlancas dw 0
    fichasNegras dw 0
    
    tablero db 64 dup(0), "$"
    bufferTeclado db 50 dup("$"),"$"  
    
    espacio db " $"
    salto db 0ah , "$"

    ;Para reportes, y archivos
    input db "rep.htm",00h;Nombre
    contenedor db 200 dup("$"),"$";Guardar Lectyra
    handle dw ?
    iniHtml db "<html><body>","$"
    h1ini db "<h1>"
    h1fin db "</h1>"
    j1 db "Jugador 1: "
    j2 db "Jugador 2: "
    saltoHtml db "<br>"
    tabIni db "<table width=400 height=400px; border=2 cellspacing=2 cellpadding=2 bgcolor=#4D4137>"
    tabFin db "</table>"
    trIni db "<tr align=center>"
    trFin db "</tr>"
    Tamarillo db "<td><font color=#F4D03F>O</font></td>"
    Tazul db "<td><font color=#3498DB>O</font></td>"
    Trojo db "<td><font color=#E74C3C>O</font></td>"
    Tcero db "<td><font color=#4D4137>.</font></td>"
    finHtml db "</body></html>","$"
    
.code 
   start:
        main proc  
            limpiarTerminal
            imprimir labJugador1, 15d
            leerNombreJ1
            imprimir salto, 0d
            imprimir enterPC, 15d
            mov ah, 10h
            int 16h

            limpiarTerminal
            imprimir labJugador2, 15d
            leerNombreJ2
            imprimir salto, 0d
            imprimir enterPC, 15d
            mov ah, 10h
            int 16h

            limpiarTerminal
            imprimir mensajeBienvenida, 15d
            imprimir salto, 0d
            imprimir salto, 0d
            iniciarMatriz
            imprimirMatriz 
            imprimir salto, 0d
            imprimir enterPC, 15d
            mov ah, 10h
            int 16h
        
            juego:
                limpiarTerminal
                cmp turnoJuego, 2d
                jz t2
                t1:
                    mov turnoJuego, 2d
                    leerComando nameJugador1, tipoJugador1, punteoJ1
                    jmp repetir
                t2:
                    mov turnoJuego, 1d
                    leerComando nameJugador2, tipoJugador2, punteoJ2
                    

                repetir:
                    cmp banderaGanador, 1d
                    jz reiniciarJ
                    jmp juego

                reiniciarJ:
                    jmp start

                salirJ:
                    .exit
        main endp
    end start