imprimir macro a, b
    local ab
    mov ah, 0Eh
    mov si, 0
ab: mov al, a[si]
    int 10h
    inc si
    cmp al, b
    jnz ab        
imprimir endm

org 100h 
jmp inicio

aob db 'Ingrese a para formato de 12hrs o b para formato de 24hrs',10, 13, 0
ddmmaai db ' Ingrese 1 para visualizar la fecha en formato hh:mm:ss', 10, 13, 0
mmddaai db 'Ingrese 2 para visualizar la fecha en formato mm:hh', 10, 13, 0
ddmmaaaai db 'Ingrese 3 para visualizar la fecha en formato ss:mm:hh', 10,13, 0
saliri db 'Ingresa 4 para salir', 10, 13, 0
ddmmaai2 db 'hh:mm:ss ', 0
mmddaai2 db 'mm:hh ', 0
ddmmaaaai2 db 'ss:mm:hh ', 0
borrar db '                               ',0

inicio: mov ah, 00
        mov al, 03
        int 10h ;abrir pantalla 
imp:    imprimir ddmmaai, 0
        imprimir mmddaai, 0
        imprimir ddmmaaaai, 0
        imprimir saliri,0
        
ingresa:mov ah, 00
        int 16h
        cmp al, '1'
        jz ddmmaa
        cmp al, '2'
        jz mmddaa
        cmp al, '3'
        jz  ddmmaaaa
        cmp al, '4'
        jz salir
        jmp ingresa

salir: ret

ddmmaa: call ddmmaap
        jmp ingresa
mmddaa: call mmddaap
        jmp ingresa
ddmmaaaa: call ddmmaaaap
          jmp ingresa

ddmmaap proc
imprimir borrar, 0
mov dl, 0
mov dh, 5
mov ah, 2
int 10h
imprimir ddmmaai2, 0

mov di, 300h
mov ah, 2ch
int 21h ;pedir hora
mov ah, 2
mov [400h], ch  ;hora
mov [401h], cl  ;min
mov [402h], dh  ;seg

mov al, [400h] 
mov ah, 0Ah
mov cx, 1            
int 10h ;imprime hora
            
mov dl, 11
mov dh, 5
mov ah, 2
int 10h
mov al, ':'
mov cx, 1
mov bh, 0
mov ah, 0Ah
int 10h ;imprime :              
   
mov dl, 12
mov dh, 5
mov ah, 2
int 10h
mov al, [401h] 
mov ah, 0Ah
mov cx, 1          
int 10h ;imprime seg    
   
mov dl, 14
mov dh, 5
mov ah, 2
int 10h
mov al, ':'
mov cx, 1
mov bh, 0
mov ah, 0Ah            
int 10h ;imprime :
                  
mov dl, 15
mov dh, 5
mov ah, 2
int 10h
mov al, [402h] 
mov ah, 0Ah 
mov cx, 1
int 10h ;imprime seg    

mov dl, 0
mov dh, 5
mov ah, 2
int 10h
                  
ret
ddmmaap endp 

mmddaap proc
imprimir borrar, 0 
mov dl, 0
mov dh, 5
mov ah, 2
int 10h
imprimir mmddaai2, 0

mov di, 300h
mov ah, 2Ch
int 21h ;pedir fecha
mov ah, 2
mov [400h], ch  ;hora
mov [401h], cl  ;min
mov [402h], dh  ;seg


mov al, [401h] 
mov ah, 0Ah
mov cx, 1            
int 10h ;imprime min   
   
mov dl, 9
mov dh, 5
mov ah, 2
int 10h
mov al, ':'
mov cx, 1
mov bh, 0
mov ah, 0Ah            
int 10h ;imprime :
                  
mov dl, 10
mov dh, 5
mov ah, 2
int 10h
mov al, [400h] 
mov ah, 0Ah 
mov cx, 1
int 10h ;imprime hora    
                  
mov dl, 0
mov dh, 5
mov ah, 2
int 10h
ret
mmddaap endp  

ddmmaaaap proc
imprimir borrar, 0 
mov dl, 0
mov dh, 5
mov ah, 2
int 10h
imprimir ddmmaaaai2, 0

mov di, 300h
mov ah, 2Ch
int 21h ;pedir fecha
mov ah, 2
mov [400h], ch  ;hora
mov [401h], cl  ;min
mov [402h], dh  ;seg


mov al, [402h] 
mov ah, 0Ah
mov cx, 1          
int 10h ;imprime seg 
            
mov dl, 14
mov dh, 5
mov ah, 2
int 10h
mov al, ':'
mov cx, 1
mov bh, 0
mov ah, 0Ah            
int 10h ;imprime :             
   
mov dl, 15
mov dh, 5
mov ah, 2
int 10h
mov al, [401h] 
mov ah, 0Ah
mov cx, 1            
int 10h ;imprime min   
   
mov dl, 17
mov dh, 5
mov ah, 2
int 10h
mov al, ':'
mov cx, 1
mov bh, 0
mov ah, 0Ah            
int 10h ;imprime :
                  
mov dl, 18
mov dh, 5
mov ah, 2
int 10h
mov al, [400h] 
mov ah, 0Ah 
mov cx, 1
int 10h ;imprime hora    
                  
mov dl, 0
mov dh, 5
mov ah, 2
int 10h

ret
ddmmaaaap endp 