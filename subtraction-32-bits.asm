DATA SEGMENT
n1 DD 9ABCD980H ; // first 32 bit number // defined double word
n2 DD 5841A748H; second number
ans DD ? ; answer
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA 

START: MOV AX,DATA; // starting of the program
MOV DS, AX; // DS ma data segment ko base address gayerw basyo
MOV DL, 00H; // DL=0 for storing borrow if generated
MOV AX, WORD PTR n1; take the lower word of first number kinaki 8086 16 bit mp ho rw 16 bit ko subtraction garna sakxa
MOV BX, WORD PTR n2;
SUB AX,BX;     // subtract lower word of answer
MOV WORD PTR ans, AX; // then store lower word of answer
MOV AX, WORD PTR n1+2; // take uppoer word of first number
MOV BX, WORD PTR n2+2; // take upper word of second number
SBB AX,BX; // subtract upper words so that ...
MOV WORD PTR ans+2, AX; // store upper word of answer in mem
JNC XX ; check if borrow is generated
INC DL; if borrow is generated increase DL regiser
XX: MOV BYTE PTR ans+4, DL; // store borrow
MOV AX, 4C00H;
INT 21H;
CODE ENDS
END START
