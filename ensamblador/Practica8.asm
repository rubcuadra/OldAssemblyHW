PrintArray MACRO Array, LastPosition 
LOCAL AB    
    mov Si, 00h
AB:    
    Mov Al, Array[si]
    mov Ah, 0Eh
    INT 10h   
    INC Si
    CMP Al, LastPosition 
JNZ AB    
PrintArray ENDM 

PrintChar MACRO Char
    mov Al, Char
    mov Ah,0Eh
    INT 10h
PrintChar ENDM 

PrintArrayColor MACRO Array,LastPosition, column  
LOCAL AB  
    mov Cx, 01  
    mov Si, 00h
    mov Di, 00
AB:    
    Mov Al, Array[si]
    PrintColor Di,column,al   
    INC Si
    INC Di
    CMP Al, LastPosition 
JNZ AB  
    
PrintArrayColor ENDM

PrintColor MACRO row, column, char    
       mov Bl, 06h
       mov Al, char
       mov Ah, 02h
       Mov Dl, row
       Mov Dh, column
       INT 10h ;Apunta a rows y columns  
       mov Ah,09
       INT 10h ;Imprimir donde esta apuntando
Print endm


VIDEO MACRO MSG, COL, REN 
    LOCAL AB   
    MOV BH, 00
    MOV BL, 0F0H   ;COLOR FONDO BLANCO LETRA NEGRA
    MOV SI, 0      ; APUNTADOR DE MENSAJE (25 CARACTERES)
    MOV DI, 1      ;CONTADOR DE RENGLONES
    MOV DH, REN    
    MOV DL, COL
AB: MOV AH, 02     ;UBICO MI CURSOR EN LA POSICION (COL, REN)
    INT 10H
    MOV AH, 09
    MOV CX, 01
    MOV AL, MSG[SI]
    INT 10H     ;IMPRIMO LA LETRA QUE SE DEBE
    INC SI   ;MUEVO LA NUEVA LETRA
    INC DL   ;LA COLUMNA A LA DERECHA  
    MOV AX, DI  ;MUEVE EL CONTADOR DE RENGLONES
    MOV AH, 05
    MUL AH
    CMP SI, AX   ;CADA CINCO CARACTERES VA A MODIFICARSE
    JNZ AB       
    INC DH      ;INCREMENTO RENGLON
    INC DI      ;INCREMENTO CONTADOR
    CMP DI, 06  
    MOV DL, COL
    JNZ AB    
VIDEO ENDM
;PROGRAMA PRINCIPAL
ORG 100H
JMP INICIO
UNO DB ' 11    1    1    1  11111',0
DOS DB '22222    2222222    22222',0
TRES DB '33333    3  333    333333',0 
CUAT DB '4   44   444444    4    4',0
CINC DB '555555    55555    555555',0
SEIS DB '6    6    666666   666666',0
SIET DB '77777    7    7    7    7',0
OCHO DB '888888   8888888   888888',0
NUEV DB '999999   999999    9    9',0
CERO DB '000000   00   00   000000',0 
SEP DB '          **********     ',0 
CUENTA DB 'CUENTA TERMINADA',0    ;ESTE SE IMPRIME A COLOR
PASSMSG DB 'Ingresa tu Password: ',0 
PASSWORD DB 'abataaosrc',0Dh 

INICIO: MOV AH, 00
        MOV AL, 03
        INT 10H     ;ABRO PANTALLA

        MOV SI, 1300H
        MOV CX, 05
CICLO:  CALL TECLA 
        SUB AL, 30H   ;CONVIERTO DE ASCII A DECIMAL
        MOV [SI], AL
        INC SI
        LOOP CICLO  ;Guarda de [01300h] hasta [01305h] 
        PrintChar 0Ah
        PrintArray PASSMSG,0h  
        mov Di, 1400h
        CALL ReadPASS   ;Tenemos la pass guardada de 1400h hasta Di
        CALL CheckPass                                             
        CMP Al,'$' 
        JZ END
timer:        
        MOV SI, 1300H  ; REGRESO MI APUNTADOR Y COMIENZO A SACAR 
        CALL SACA   
        CALL UnSeg
        CALL ReduceSeconds 
        CMP Al,'!'
JNZ timer
                                                
        ;Falta ir restando en 1 los segundos hasta 0, call saca seguido
        ;si llegan a 00 restar 1 minuto y poner segundos en 60
          
        
        PrintArrayColor CUENTA,0,8
END:
        RET

;TOMA DESDE TECLADO LOS NUMEROS DE INICIO DEL TEMPORIZADOR
TECLA PROC
    MOV AH, 01
AC: INT 16H
    JZ AC        ;CUANDO SE OPRIME ALGO, SE GUARDA EN AL
    MOV AH, 00
    INT 16H 
    MOV AH, 0EH  ;DE UNA VEZ IMPRIMO LO QUE TOME DESDE TECLADO
    INT 10H
    RET 
TECLA ENDP

;FUNCION QUE IMPRIMIR EN GRANDE LOS NUMEROS DE INICIO
SACA PROC 
    MOV [1305H],2
    MOV CX, 5
AQUI: MOV AL, [SI]
    PUSH SI
    PUSH CX
    CMP AL, 0
    JNZ U
    VIDEO CERO, [1305H], 2   ;NUMERO CERO 
    JMP SIGUE
U:  CMP AL, 1
    JNZ D
    VIDEO UNO, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
D:  CMP AL, 2
    JNZ T
    VIDEO DOS, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
T:  CMP AL, 3
    JNZ C
    VIDEO TRES, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
C:  CMP AL, 4
    JNZ CI
    VIDEO CUAT, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
CI:  CMP AL, 5
    JNZ S
    VIDEO CINC, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
S:  CMP AL, 6
    JNZ SIE
    VIDEO SEIS, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
SIE:  CMP AL, 7
    JNZ O
    VIDEO SIET, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
O:  CMP AL,8
    JNZ N
    VIDEO OCHO, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
N:  CMP AL,9
    JNZ W
    VIDEO NUEV, [1305H], 2   ;NUMERO UNO
    JMP SIGUE
W:  VIDEO SEP, [1305H], 2 
SIGUE: POP CX
       POP SI
       ADD [1305H],08
       INC SI
       LOOP AQUI
       RET
SACA ENDP 

ReadPASS PROC    
READ:
    mov Ah, 01h
TECL:
    INT 16h
JZ TECL
    mov Ah,00h
    INT 16h
    stosb 
    CMP Al,0Dh   
    PrintChar '*'
JNZ READ     
    RET
ReadPASS ENDP 

CheckPass PROC  
    SUB DI, 1400h
    CMP DI, 0BH
JNZ FINPROGRAMA       ;SI SON DE DIFERENTE TAMAÑO ACABA
    mov Si, 1400h
    mov Di, 00h    ;Index
Checker:    
    lodsb
    CMP Al,PASSWORD[Di]  
JNZ FINPROGRAMA           ;Si son Diferente Char en posicion [Di], acaba
    INC Di
    CMP Al,0Dh
JNZ Checker 
    RET 
    FINPROGRAMA:
    mov al,'$'
    RET      
CheckPass ENDP

UnSeg PROC 
    mov Cx, 0FH
    mov Dx, 4240H  
    Mov Ah, 86h
    INT 15h 
    ret 
UnSeg ENDP   

ReduceSeconds PROC
    CMP [1304h],00h
JZ decenSegs 
    DEC [1304h]
    JMP Listo
decenSegs:
    CMP [1303h],00h
JZ unidadMins      ;Salta si son iguales
    DEC [1303h]
    mov [1304h],09h 
    JMP Listo
unidadMins:   
    CMP [1301h],00h
JZ decenasMins 
    DEC [1301h]
    mov [1303h],05h
    mov [1304h],09h 
    JMP Listo
decenasMins:
    CMP [1300h],00h
JZ acabado
    DEC [1300h]
    mov [1301h],09h
    mov [1303h],05h
    mov [1304h],09h
    JMP Listo
acabado:
    mov al, '!'
Listo: 
    RET   
ENDP 