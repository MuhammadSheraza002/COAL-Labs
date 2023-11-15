.model small
.stack 100h
.386
.code
main proc
        mov ax,@data
        mov ds,ax
        mov ax,0h
        mov bx,0h
        mov dx,offset Enter_Message
        call display_mesgage
        mov cx, 4
        call input_in_decimal
        mov dx,offset Output_Message
        call display_mesgage
        mov cx, 4
        call output_in_Hexa_decimal
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


input_in_decimal proc
    again:
        mov ah, 01
        int 21h
        sub al, 30h
        rol bx, 4
        or bl, al
        dec cx
        jnz again
        ret

input_in_decimal endp

output_in_Hexa_decimal proc
    loop:
    rol bx,4
    mov dl,bl
    and dl,0fh
    add dl,30h
    mov ah,02
    int 21h
    dec cx
    jnz loop
    ret

output_in_Hexa_decimal endp




main endp
.data
    Enter_Message  db 10,13,"Enter No in Decimal: $"
    Output_Message db 10,13,"Output In HexaDecimal is: $"
    illegal_message db 10,13,"Illegal Input, Try Again$"

end main