include macro.asm

.model small
.stack 100h
.data
    uni db "Universidad de San Carlos de Guatemala $"
    fac db "Facultad de Ingenieria $"
    curso db "Arquitectura de Ensambladores y Computadores 1 $"
    sem db "Segundo Semestre 2021 $"
    exam db "Examen Final de Laboratorio $"
    nombre db "Vernik Carlos Alexander Yaxon Ortiz 201712057 $"
    saltoL db 13

    ingresar db "Ingrese el numero a convertir, ej: 0035, 1245, 0003 $"
    pres db "Presione enter para continuar... $"
    bufferTeclado db 50 dup("$"),"$" 
    
.code
    start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        main proc
            mov ah, 0 ;activa el modo video
            mov al, 03h ;tipo de modod de video modo texto es el 03h
            int 10h

            reinicio:
                limpiarBuffer
                limpiarTerminal
                encabezado
                
                imprimir10h ingresar, 51,15d,0,9
                imprimir10h saltoL, 1, 0d,0,10
                leerHastaEnter bufferTeclado
                
                convertirNumero

                imprimir10h pres, 32, 15d,0,16
                mov ah, 10h
                int 16h
            jmp reinicio


         main endp
    end start