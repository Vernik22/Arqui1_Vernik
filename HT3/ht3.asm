include macros.asm

.model small
.stack 100h
.data
    nombre db "Vernik Yaxon - 201712057 $"
    f db "fecha: "
    h db "hora: "
    
.code
    start:
        mov ax, @data
        mov ds, ax
        mov es, ax
        main proc
            mov ah, 0 ;activa el modo video
            mov al, 03h ;tipo de modod de video modo texto es el 03h
            int 10h

            imprimir10h nombre, 25,12d,25,9
            
            reloj:
                mfecha
                mhora
            jmp reloj


         main endp
    end start