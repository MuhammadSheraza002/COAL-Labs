;Write a program to (a) display a "?", (b) read two decimal digits who.se sum "is less than 10, (c) display them and their sum on the next ;line, with an appropriate message. Sample execution: ?27 '!'HE SlJM OF 2 .'\ND 7 IS 9
.MODEL SMALL
 .STACK 100H
 
 .DATA
    PROMPT_1  DB  'Enter the First digit : $'
    PROMPT_2  DB  'Enter the Second digit : $'
    PROMPT_3  DB  'Sum of First and Second digit : $'
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
 
     LEA DX, PROMPT_1             ; load and display the PROMPT_1
     MOV AH, 9
     INT 21H
 
     MOV AH, 1                    ; read a character\digit
     INT 21H
 
     MOV BL, AL                   ; save First digit in BL in ASCII code
     SUB BL, 30H
 
     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H
                         
     MOV DL, 0AH                  ; line feed
     INT 21H
 
     LEA DX, PROMPT_2             ; load and display the PROMPT_2
     MOV AH, 9
     INT 21H
 
     MOV AH, 1                    ; read a character
     INT 21H
 
     MOV BH, AL                   ; save Second digit in BH in ASCII CODE
     SUB BH, 30H
 
     MOV AH, 2                    ; carriage return
     MOV DL, 0DH
     INT 21H
                         
     MOV DL, 0AH                  ; line feed
     INT 21H
 
     LEA DX, PROMPT_3             ; load and display the PROMPT_3
     MOV AH, 9
     INT 21H
 
     ADD BL, BH                   ; add First and Second digit
     ADD BL, 30H                  ; convert ASCII to DECIMAL code
 
     MOV AH, 2                    ; display the character
     MOV DL, BL     
     INT 21H
                         
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN