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
               mov cx,16
               ;shl bx,03
               jmp again
    

    again:     
               shl bx,1
               jc  One
               mov dl,30h
               mov ah,02
               int 21h
               dec cx
               jnz again
               jmp exit
    One:       
               mov dl,31h
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
    Output_Message db 10,13,"Output in Binary is: $"


end main