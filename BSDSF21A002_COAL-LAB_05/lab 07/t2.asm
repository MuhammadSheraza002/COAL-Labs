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
               mov cx,4
               call input_hexa

               mov dx,offset Enter_Message
               call display_mesgage
               MOV DX,bX
               mov bx,0000h
               mov cx,4
               call input_hexa
               call addition


               mov dx,offset Output_Message
               call display_mesgage
               mov cx,4
               jnc o
               mov dl,31h
               call display
               o:call output_HEXA
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
add bX,dX
ret
addition endp



input_hexa proc
               again:
                    mov ah, 01
                    int 21h
                    cmp al,30h
                    jl illegal

                    cmp al, 39H
                    jbe aa
                    cmp al,'F'
                    jg illegal
                    cmp al,'A'
                    jl illegal
                    sub al, 37h
                    jmp exit
                    illegal:
        
                    call main
                    jmp e
                    aa:
                    sub al, 30h
                    exit:
                    rol bx, 4
                    or bl, al
                    dec cx
                    jnz again

e: ret
input_hexa endp

output_HEXA PROC
                    
                    again1:
                    rol bx, 4
                    mov dl, bl
                    and dl, 0fh
                    cmp dl, 9h
                    jbe alpha
                    add dl, 37h
                    mov ah, 02
                    int 21h
                    jmp e1

                    alpha:
                    add dl, 30h
                    mov ah, 02
                    int 21h
                    e1:dec cx
                    jnz again1

e2:ret
output_HEXA endp

                    
main endp
.data
    Enter_Message  db 10,13,"Enter No in HexaDecimal: $"
    Output_Message db 10,13,"Sum is: $"
    illegal_message db 10,13,"Illegal Input, Try Again$"

end main