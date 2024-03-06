data SEGMENT
    mes1    DB 10,13, 'Enter a string $'
    mes2    DB 10,13, 'String is palindrome $'
    mes3    DB 10,13,'String is not palindrome $'
    str     DB 50 DUP(0)
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data

START:
    MOV AX, data
    MOV DS, AX

    ; Display prompt message to enter a string
    LEA DX, mes1
    MOV AH, 09H
    INT 21H

    ; Read a string from the user
    LEA SI, str
    LEA DI, str
    
READSTRING:
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH    ; Check for carriage return  enter dabyo vane terminate hunxa
    JE  TERMINATE  ; If carriage return, terminate input
    MOV [DI], AL
    INC DI
    JMP READSTRING

TERMINATE:
    MOV AL, '$'
    MOV [DI], AL

CHECK:
    DEC DI
    MOV AL, [SI]
    CMP [DI], AL
    JNE NOTPALINDROME
    
    INC SI
    CMP SI, DI
    JL CHECK     ;  
    
PALINDROME:
    MOV AH, 09H
    LEA DX, mes2
    INT 21H
    JMP XX   
    
NOTPALINDROME:
    MOV AH, 09H
    LEA DX, mes3
    INT 21H

XX: 
    MOV AH, 4CH
    INT 21H
    
code ENDS
END START
