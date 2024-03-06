DATA SEGMENT ; It means this is a particular segment named "DATA"
S1 DB 10, 1,2,3,4,5,6,7,8,9,0 ; 10 is no of data and remaining are data to be transferred
S2 DB DUP(0) ; DB defined bytes and DUP Is used to initialize several locations to zero
DATA ENDS;

CODE SEGMENT ; New segment named CODE
ASSUME CS:CODE, DS:DATA ; So we now said that code segment is actually code and ...
START:
MOV AX, DATA; // aba data segment lai DS ma move garaunuu parxa.. code segment chai automatically  move hunxa
MOV DS, AX; // Now accumulator bata DS ma move vayo, now DS is initialized with base address
MOV ES, AX; // similary ES ma pani move garayau and it is initialized with base address

LEA SI, S1; // data segment ko offset address S1 bata start hos
LEA DI, S2; // rw extra segment ko offset adderss S2  bata start hos

MOV CL, [SI]; // CL register ma SI ko value rakhidem to make counter so CL ma A xa
MOV CH, 00H; // and CH lai 00H banaunupryo so that CX is 0A00H hos

INC SI; // SI lai ek le increase garum
CLD; clear direction flag so that string pointers auto increment after each string operation
; // SO SI RW DI auto increase hunxan
REP MOVSB; MOV Data from DS:SI to ES:DI, decreament CX by 1 and repeats the same until CX is 0

;; NOW TO END PROGRAM
MOV AX, 4C00H;
INT 21H; // interrupt to terminate the program
CODE ENDS;
END START;


