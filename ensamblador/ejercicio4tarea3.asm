PRINT1 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '1'
        MOV BH, 0    
         
        ADD DL,2D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D
        
        CALL HELPER1 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 1
        ADD DL, 1
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
             
        ;ESCRIBIR LO DE ABAJO DEL 1
        MOV CX, 5
        MOV DH, [6000H]
        MOV DL, [6001H] 
        ADD DH, 4 
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT1 ENDM

PRINT2 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX , 1
        MOV BL, COLOR
        MOV AL, '2'
        MOV BH, 0    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT2 ENDM 

PRINT3 MACRO POSICIONR,POSICIONC, COLOR
  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '3'
        MOV BH, 0 
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT3 ENDM    

PRINT4 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '4'
        MOV BH, 0    
         
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D
        
        CALL HELPER4 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 0
        ADD DL, 0
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 1
        ADD DL, 0
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
             
        ;ESCRIBIR LO DE ABAJO DEL 1
        MOV CX, 5
        MOV DH, [6000H]
        MOV DL, [6001H] 
        ADD DH, 2 
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT4 ENDM 

PRINT5 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '5'
        MOV BH, 0 
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT5 ENDM 

PRINT6 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '6'
        MOV BH, 0 
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H  
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT6 ENDM   

PRINT7 MACRO POSICIONR,POSICIONC, COLOR
  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '7'
        MOV BH, 0 
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        ADD DL, 2
        MOV CX, 3D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
                       
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
        
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 4
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
    
PRINT7 ENDM 

PRINT8 MACRO POSICIONR,POSICIONC, COLOR
    
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '8'
        MOV BH, 0 
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D    
          
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 2
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
                        ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
         
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT8 ENDM  

PRINT9 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '9'
        MOV BH, 0    
         
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D
        
        CALL HELPER4 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 0
        ADD DL, 0
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 1
        ADD DL, 0
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
             
        ;ESCRIBIR LO DE ABAJO DEL 1
        MOV CX, 5
        MOV DH, [6000H]
        MOV DL, [6001H] 
        ADD DH, 2 
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
        MOV CX, 5
        MOV DH, [6000H]
        MOV DL, [6001H] 
        ADD DH, 0 
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT9 ENDM  

PRINT0 MACRO POSICIONR,POSICIONC, COLOR  
        
        MOV DL, POSICIONC ;TOMAMOS EL PARARMETRO Y LO POSICIONAMOS EN DL
        SUB DL, 1 ;RESTAMOS 1 A DL 
        MOV AX, 0  ;BORRAMOS TODO LO DE AX
        MOV AL, DL ;MOVEMOS LO DE DL A AL
        MUL [6002H]  ;MULTIPLICACION AL POR 5
        MOV DL, AL ;RESGRESAMOS EL RESULTADO A DL 
        MOV DH, POSICIONR ;LO MISMO CON EL RENGLON
        SUB DH, 1 
        MOV AX, 0
        MOV AL, DH
        MUL [6002H] 
        MOV DH, AL
        MOV [6000H], DH ; ALMACENAMOS POSICION INICIAL DEL CUADRO EN CUESTION EN MEMORIA
        MOV [6001H], DL
        
        MOV CX, 1
        MOV BL, COLOR
        MOV AL, '0'
        MOV BH, 0    
        
        ADD DL,4D ;NOS DESPLAZAMOS DOS POSICIONES EN COLUMNA PARA COMENZAR A ESCRIBIR 
        
        MOV [6003H], 5D  
                ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
                                       ;ESCRIBIR PRIMER RENGLON
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DH, 4
        MOV CX, 5D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 4
        ADD DH, 2
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H  
        
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 2
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H
        
         
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 1
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H   
                
        MOV DH, [6000H]
        MOV DL, [6001H]
        ADD DL, 0
        ADD DH, 3
        MOV CX, 1D
        MOV AH, 02H ;mover cursor
        INT 10h
        MOV AH, 09H
        INT 10H 
    
PRINT0 ENDM

PRINTNUMBER MACRO NUMBER,  REN, COL, COLOR
    LOCAL CERO
    LOCAL UNO
    LOCAL DOS
    LOCAL TRES
    LOCAL CUATRO
    LOCAL CINCO
    LOCAL SEIS
    LOCAL SIETE
    LOCAL OCHO
    LOCAL NUEVE
    LOCAL TERMINAR
    MOV AL, NUMBER
    MOV BH, REN
    MOV BL, COL
    CMP AL, 0
    JE CERO
    CMP AL, 1
    JE UNO
    CMP AL, 2
    JE DOS
    CMP AL, 3
    JE TRES
    CMP AL, 4
    JE CUATRO
    CMP AL, 5
    JE CINCO
    CMP AL, 6
    JE SEIS
    CMP AL, 7
    JE SIETE
    CMP AL, 8
    JE OCHO
    CMP AL, 9
    JE NUEVE
    JMP TERMINAR
    CERO:
     PRINT0 BH, BL, COLOR 
     JMP TERMINAR
    UNO:
     PRINT1 BH, BL, COLOR
     JMP TERMINAR
    DOS:
     PRINT2  BH, BL, COLOR
     JMP TERMINAR
    TRES:
     PRINT3  BH, BL, COLOR
     JMP TERMINAR
    CUATRO:
     PRINT4  BH, BL, COLOR
     JMP TERMINAR
    CINCO:
     PRINT5  BH, BL, COLOR
     JMP TERMINAR
    SEIS:
     PRINT6  BH, BL, COLOR
     JMP TERMINAR
    SIETE:
     PRINT7  BH, BL, COLOR
     JMP TERMINAR
    OCHO:
     PRINT8  BH, BL, COLOR
     JMP TERMINAR
    NUEVE:
     PRINT9  BH, BL, COLOR
     JMP TERMINAR          
    TERMINAR:
PRINTNUMBER ENDM

;programa principal
ORG 100H



CARGARRELOJ:
MOV AH, 00H
MOV AL, 03H
MOV [6002H], 5D 
INT 10H
   

MOV AH, 2CH
INT 21H
MOV [010H], CH
MOV [011H], CL
MOV [012H], DH

MOV AX, 0
MOV AL, CH
MOV DL, 0
MOV DL, 10D
DIV DL
PRINTNUMBER AL, 3, 1, 0E0H

MOV AH, 2CH
INT 21H

MOV AX, 0
MOV AL, CH
MOV DL, 0
MOV DL, 10D
DIV DL   
CMP AL, 0
PRINTNUMBER AH, 3, 2, 0E0H



MOV AH, 2CH
INT 21H
MOV AX, 0
MOV AL, CL
MOV DL, 0
MOV DL, 10D
DIV DL

PRINTNUMBER AL, 3, 4, 0E0H

MOV AH, 2CH
INT 21H
MOV AX, 0
MOV AL, CL
MOV DL, 0
MOV DL, 10D
DIV DL
PRINTNUMBER AH, 3, 5 0E0H  
                         
                         
MOV AH, 2CH
INT 21H
MOV AX, 0
MOV AL, DH
MOV DL, 0
MOV DL, 10D
DIV DL

PRINTNUMBER AL, 3, 7, 0E0H

MOV AH, 2CH
INT 21H
MOV AX, 0
MOV AL, DH
MOV DL, 0
MOV DL, 10D
DIV DL
PRINTNUMBER AH, 3, 8, 0E0H

ret      

LIMPIARREGISTROS PROC
    MOV AX, 0
    MOV BX, 0
    MOV CX, 0
    MOV DX, 0
    RET
LIMPIARREGISTROS ENDP

HELPER1 PROC
    DAD:
    MOV AH, 02H ;mover cursor
    INT 10h 
    MOV AH, 09h  ;ESCRIBIR CARACTER
    INT 10H
    INC DH 
    DEC [6003H] 
    CMP [6003H], 0D
    JNZ DAD
    RET
HELPER1 ENDP 

HELPER4 PROC
    DAD4:
    MOV AH, 02H ;mover cursor
    INT 10h 
    MOV AH, 09h  ;ESCRIBIR CARACTER
    INT 10H
    INC DH 
    DEC [6003H] 
    CMP [6003H], 0D
    JNZ DAD4
    RET
