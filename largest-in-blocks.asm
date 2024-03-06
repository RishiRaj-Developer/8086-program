DATA SEGMENT
    X   DW 0010H, 1234H, 30H, 40H, 50H   ; Array of words
    LAR DW ?                           ; Variable to store the largest element
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA     ; Load data segment address into AX
    MOV DS, AX       ; Initialize DS with the base address of the data segment

    MOV CX, 05H      ; Set CX to the number of elements in the array
    LEA SI, X        ; Load effective address of array X into SI

FIND_MAX:
    MOV AX, [SI]     ; Load the next element into AX
    CMP AX, [SI + 2] ; Compare with the next element
    JA  UPDATE_MAX   ; Jump if the next element is greater
    ADD SI, 2        ; Move to the next element
    LOOP FIND_MAX    ; Repeat for the remaining elements
    ; LOOP decrease CX by 1 and if CX != 0 then jump to short label 

UPDATE_MAX:
    MOV LAR, AX      ; Store the largest element in LAR

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

CODE ENDS
END START
