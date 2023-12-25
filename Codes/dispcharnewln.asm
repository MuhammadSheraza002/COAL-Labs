;An Assembly Language Program to read a character and display it on a new line
.STACK 100H
 
 .CODE
   MAIN PROC
     MOV AH, 1                    ; read a character
     INT 21H
 
     MOV BL, AL                   ; save input character into BL
 
     MOV AH, 2                    ; carriage return
     MOV DL, 0DH          
     INT 21H
 
     MOV DL, 0AH                  ; line feed
     INT 21H
 
     MOV AH, 2                    ; display the character stored in BL   
     MOV DL, BL
     INT 21H
 
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
 
   MAIN ENDP
 END MAIN