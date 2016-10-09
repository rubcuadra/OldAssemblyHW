org 100h

;multiplicación de los primeros 16 bits
mov ax,0fde5h  
mov bx,0cbc4h
mov di,0170h ;se comienzan a guardar los resultados en la dirección 07170h

mul bx
stosw ;almacena en 0170h
mov ax,dx
stosw ;almacena en 0172h

mov ax,00fde5h
mov bx,0c3ah

mul bx
mov bx,ax
mov si,0172h
lodsw
add ax,bx
adc dx,0h
stosw ;almacena en 0174h
mov ax,dx
stosw ;almacena en 0176h


;multiplicación de los bits restantes
mov ax,032h
mov bx,0cbc4h

mul bx
stosw ;almacena en 0178h
mov ax,dx
stosw ;almacena en 017ah 

mov ax,032h
mov bx,0c3ah

mul bx
mov bx,ax
mov si,017ah
lodsw
add ax,bx
adc dx,0h
stosw ;almacena en 017ch
     
     
;suma de resultados de ambas multiplicaciones     
mov si,0170h
lodsw
stosw ;almacena en 017eh

mov si,0174h
lodsw
mov bx,ax
mov si,0178h
lodsw
add ax,bx
stosw ;almacena en 0180h

mov si,0176h
lodsw
mov bx,ax
mov si,017ch
lodsw
adc ax,bx
stosw ;almacena en 0182h

adc dx,0h
mov ax,dx
stosw ;almacena en 0184h


hlt