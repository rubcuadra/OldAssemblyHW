org 100h

mov al,56o
mov bl,42h
mov cl,bl

sumaSucesiva:
rep add dx,ax
loop sumasucesiva     

hlt