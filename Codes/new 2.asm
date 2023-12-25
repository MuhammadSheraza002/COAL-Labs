.MODEL SMALL
.STACK 100H
 
 .DATA
   PROMPT_1  DB  'Enter a line of text : $'
   PROMPT_2  DB  0DH,0AH,'First Capital Letter : $'
   PROMPT_3  DB  0DH,0AH,'Last Capital Letter  : $'
   PROMPT_4  DB  0DH,0AH,' *****  No Capital Letters  *****$'
 
   FLAG          DB  0
   FIRST_LETTER  DB  5BH
   LAST_LETTER   DB  40H
 
 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX
 
     LEA DX, PROMPT_1             ; load and display the string PROMPT_1
     MOV AH, 9
     INT 21H
 
     MOV AH, 1                    ; set input function
 
     @INPUT:                      ; jump label
       INT 21H                    ; read a character
 
       MOV BL, AL                 ; set BL=AL
 
       CMP BL, 0DH                ; compare BL with CR
       JE @END_INPUT              ; jump to label @END_INPUT if BL=CR
 
       CMP BL, "A"                ; compare BL with "A"
       JL @INPUT                  ; jump to label @INPUT if BL<A
 
       MOV FLAG, 1                ; set FLAG=1
 
       CMP BL, "Z"                ; compare BL with "Z"
       JG @INPUT                  ; jump to label @INPUT if BL>Z
 
       CMP BL, FIRST_LETTER       ; compare BL with variable FIRST_LETTER
       JG @NEXT                   ; jump to label @NEXT if BL>FIRST_LETTER
       MOV FIRST_LETTER, BL       ; set FIRST_LETTER=BL
 
       @NEXT:                     ; jump label
         CMP BL, LAST_LETTER      ; compare BL with variable LAST_LETTER
         JL @INPUT                ; jump to label @INPUT if BL<LAST_LETTER
         MOV LAST_LETTER, BL      ; set LAST_LETTER=BL
 
     JMP @INPUT                   ; jump to label @INPUT
 
     @END_INPUT:                  ; jump label
 
     CMP FLAG, 1                  ; compare FLAG with 1             
     JE @DISPLAY                  ; jump to label @DISPLAY if FLAG=1
 
     LEA DX, PROMPT_4             ;  load and display the string PROMPT_4
     MOV AH, 9                    
     INT 21H
 
     JMP @END                     ; jump to label @END
 
     @DISPLAY:                    ; jump label
       LEA DX, PROMPT_2           ; load and display the string PROMPT_2
       MOV AH, 9                  
       INT 21H                    
 
       MOV AH, 2                  ; set output function
       MOV DL, FIRST_LETTER       ; set DL=FIRST_LETTER
       INT 21H                    ; print a character
 
       LEA DX, PROMPT_3           ; load and display the string PROMPT_3
       MOV AH, 9                  
       INT 21H                    
 
       MOV AH, 2                  ; set output function
       MOV DL, LAST_LETTER        ; set DL=LAST_LETTER
       INT 21H                    ; print a character
 
     @END:                        ; jump label
 
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN