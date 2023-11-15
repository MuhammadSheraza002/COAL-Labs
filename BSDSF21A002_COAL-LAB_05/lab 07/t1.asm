.model small 
.stack 100h
.386
.code
main proc
               mov ax,@data
               mov ds,ax
               mov cx,16
               mov bx,0
               mov ax,0
               mov dx,offset Enter_Message
               call display_mesgage
               mov cx,8
               call input_in_binary
               mov dx,offset Enter_Message
               call display_mesgage
               mov cx,8
               call input_in_binary
               call addition

               mov dx,offset Output_Message
               call display_mesgage
               mov cx,8
               jnc o
               mov dl,31h
               call display
               o:call output_binary


               mov ah,4ch
               int 21h



display PROC

mov ah,02
int 21h
ret     
display ENDP




display_mesgage PROC

mov ah,09
int 21h
ret     
display_mesgage ENDP

addition proc
mov dx,0000h
mov dl,bl
add dl,bh
mov bl,dl
ret
addition endp


input_in_binary proc
               SHl bx,1
               mov ah,01
               int 21h
               cmp al ,30h
               jl illegal
               cmp al ,31h
               jg illegal
               sub al,30h
               or  bl,al
               dec cx
               jnz input_in_binary
               jmp e
            illegal:
            mov dx,offset illegal_message
            call display_mesgage
            call main
            e:
                ret
input_in_binary endp



output_binary proc
               again:shl bl,1
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

    exit:
    ret
output_binary endp



main endp
.data
    Enter_Message  db 10,13,"Enter No in Binary: $"
    Output_Message db 10,13,"Sum is: $"
    illegal_message db 10,13,"Illegal Input, Try Again$"


end main