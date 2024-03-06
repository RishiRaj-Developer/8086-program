data SEGMENT
    fN DD 23454567H
    sN DW 4111H
    quo DW 1 DUP(0)
    rem DW 1 DUP(0)
data ENDS

code SEGMENT
    ASSUME CS:code, DS:data

START:
    MOV AX, data
    MOV DS, AX

    MOV AX, fN
    MOV DX, fN+2

    DIV sN
    MOV quo, AX
    MOV rem, DX

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START

