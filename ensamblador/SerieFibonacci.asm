org 100h

;Inicializaci�n de valores
mov ax,0h ;se le asigna 0000h a AX
mov bx,1h ;se le asigna 0001h a BX

mov cx,24d ;se le asigna 0018h a CX para realizar 24 iteraciones de la sucesi�n
;(para registros de 16bits s�lo se puede trabajar m�ximo hasta el n�mero 24 en la sucesi�n de Fibonacci)
mov si,0120h ;se le asigna la direcci�n 07120h a SI
mov di,0120h ;se le asigna la direcci�n 07120h a DI
stosw ;almacena 00 en las direcciones 07120h y 07121h, y reasigna la direcci�n 07122 a DI

;ciclo
fibonacci: ;etiqueta
add ax,bx ;suma AX con BX y guarda el resultado en AX
stosw ;almacena el resultado en la memoria
mov bx,ax ;asigna a BX el resultado de la suma
lodsw ;asigna a AX el valor guardado antes del resultado de la suma actual
loop fibonacci ;repite el c�digo despu�s de la etiqueta tantas veces dicte CX

hlt