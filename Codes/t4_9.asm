;An Assembly Language Program that prompt the user read first middle and last initials of a persons name display them down the left margin


.MODEL SMALL
 .STACK 100H
 
 .DATA
    MSG_1  EQU  'Enter three initials : $'
    MSG_2  EQU  0DH,0AH,'The initials are :',0DH,0AH,'$'
    MSG_3  EQU  0DH,0AH,'$'
 
    PROMPT_1  DB  MSG_1
    PROMPT_2  DB  MSG_2
    NEWLINE   DB  MSG_3
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
 
     LEA DX, PROMPT_1             ; load and display PROMPT_1 
     MOV AH, 9
     INT 21H
 
     MOV AH, 1                    ; read first initial
     INT 21H
 
     MOV BL, AL                   ; save the first initial into BL
 
     MOV AH, 1                    ; read second initial
     INT 21H
 
     MOV BH, AL                   ; save the second initial into BH
 
     MOV AH, 1                    ; read third initial
     INT 21H
 
     MOV CL, AL                   ; save the third initial into CL
 
     LEA DX, PROMPT_2             ; load and display PROMPT_2
     MOV AH, 9
     INT 21H
 
     MOV AH, 2                    ; display the first initial
     MOV DL, BL
     INT 21H
 
     LEA DX, NEWLINE              ; display new line
     MOV AH, 9
     INT 21H
 
     MOV AH, 2                    ; display the second initial
     MOV DL, BH
     INT 21H
 
     LEA DX, NEWLINE              ; display new line 
     MOV AH, 9
     INT 21H
 
     MOV AH, 2                    ; display the third initial
     MOV DL, CL
     INT 21H
 
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN