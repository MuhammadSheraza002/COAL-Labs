.model small 
.stack 100h
.386
.code
main proc

               mov ax,@data
               mov ds,ax
               mov cx,4
               mov dx,offset Enter_Message
               mov ah,09
               int 21h
    input_loop:
               shl bx,4
               mov ah,01
               int 21h
               sub al,30h
               or  bl,al
               cmp cx,0
               je   Output_loop
               dec cx
               jnz input_loop

    Output_loop:            
               mov dx,offset Output_Message
               mov ah,09
               int 21h
               mov cx,4
               shl bx,03
               jmp again

    again:     
               rol bx,4
               mov al,bl
               and al,0fh
               cmp al,9
               jle  Print9
               add al, 55
               mov dl,al
               mov ah,02
               int 21h
               dec cx
               jnz again
               jmp exit
    Print9:    
               add al,30h     
               mov dl,al     
               mov ah,02
               int 21h
               dec cx
               jnz again
               jmp exit
    exit:      mov ah,4ch
               int 21h


main endp
.data
    Enter_Message  db 10,13,"Enter No in HexaDecimal: $"
    Output_Message db 10,13,"Output in HexaDecimal is: $"


end main