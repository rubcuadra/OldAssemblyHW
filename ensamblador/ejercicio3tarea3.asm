imprimir macro a, b
    local ab
    mov ah, 0Eh
    mov si, 0
ab: mov al, b[si]
    int 10h
    inc si
    cmp al, a
    jnz ab        
imprimir endm 

org 100
jmp inicio

instruccion db 'Ingresa una palabra: ', 10, 13, 0
instruccion2 db 'Ingresa 1 para imprimir en rojo, 2 para azul, 3 para verde, 4 para amarillo: ', 10, 13, 0


inicio:
mov ah, 00
mov al, 03
int 10h      ;abrir pantalla

imprimir instruccion, 0 
call teclado
imprimir instruccion2, 0


teclado proc
mov di, 300h
entrada:    mov ah, 01
ab:         int 16h     ;tomo el dato desde el teclado
            jz ab
            stosb
            mov ah, 00
            int 16h  ;limpiar el buffer
            cmp al, 0dh ;compara contra enter
            jnz entrada
mov si, 300h
;sacar los datos ingresados por video
salida:     mov ah, 0eh
            lodsb
            int 10h ;imprimi en pantalla
            cmp al, 0dh
            jnz salida
            ret 
endp teclado