org 100h

;Inicialización de valores
mov ax,0h ;se le asigna 0000h a AX
mov bx,1h ;se le asigna 0001h a BX

mov cx,24d ;se le asigna 0018h a CX para realizar 24 iteraciones de la sucesión
;(para registros de 16bits sólo se puede trabajar máximo hasta el número 24 en la sucesión de Fibonacci)
mov si,0120h ;se le asigna la dirección 07120h a SI
mov di,0120h ;se le asigna la dirección 07120h a DI
stosw ;almacena 00 en las direcciones 07120h y 07121h, y reasigna la dirección 07122 a DI

;ciclo
fibonacci: ;etiqueta
add ax,bx ;suma AX con BX y guarda el resultado en AX
stosw ;almacena el resultado en la memoria
mov bx,ax ;asigna a BX el resultado de la suma
lodsw ;asigna a AX el valor guardado antes del resultado de la suma actual
loop fibonacci ;repite el código después de la etiqueta tantas veces dicte CX

hlt