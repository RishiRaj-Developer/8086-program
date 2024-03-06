DATA SEGMENT
    num DW 1234H,1234H;
    prod DW 2 DUP(0); // variable name product since multipication is 32 bit so
    ;1 word in 8 bit 8085 is 8 bit but one word in 16 bit 8086 is 16 bit. so we need 32 bit so DW 2
    ; and all the words should be 0000H
    
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA;
    START:
        MOV AX, DATA;  
        MOV DS, AX;
        
        LEA SI, num;
        MOV AX, [SI]; // it will take a word and load it AX
        MOV BX, [SI+2];
        MUL BX; // we use IMUL for signed multipication
        MOV prod, AX;
        MOV prod+2, DX;
        
        ; Terminal program
        MOV AH, 4CH
        INT 21H;
CODE ENDS;
    END START;
        
