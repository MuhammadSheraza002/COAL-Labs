.model small 
.stack 100h
.386
.code
main proc
               mov ax,@data
               mov ds,ax
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
               mov dx,offset Output_Message_Binary
               call display_mesgage
               call output_binary

               mov dx,offset Output_Message_Hexa
               call display_mesgage
               mov cx,4
               jnc o
               mov dl,31h
               call display
               o:call output_HEXA
               mov dx,offset Output_Message_Decimal
               call display_mesgage
               call output_decimal
               
               
               mov ah,4ch
               int 21h

main endp


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
                    mov cx,4
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


output_binary proc
               mov cx,16
    

    loop1:     
               rol bx,1
               mov dl,bl
               and dl,01h
               add dl,30h
               mov ah,02
               int 21h
               dec cx
               jnz loop1
               
            ret
output_binary endp



output_decimal proc 
    mov ax,bx
    mov bx,10
    mov cx,0
    loop2:
    mov dx,0000h
    div bx
    push dX
    inc cx
    cmp ax,0009h
    ja loop2
    mov dl,al
    add dl,30h
    mov ah,02
    int 21h

stack_print:
    pop dx
    add dl,30h
    mov ah,02
    int 21h
    dec cx
    jnz stack_print
ret
output_decimal endp




.data
    Enter_Message  db 10,13,"Enter No in HexaDecimal: $"
    Output_Message_Hexa db 10,13,"Sum in Hexa is: $"
    Output_Message_Binary db 10,13,"Sum in Binary is: $"
    Output_Message_Decimal db 10,13,"Sum in Decimal is: $"
    illegal_message db 10,13,"Illegal Input, Try Again$"

end main