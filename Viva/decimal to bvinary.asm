.model small
.stack 100h
.386
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ax,1234
    call output_in_binary
    mov ah, 4ch
    int 21h
main endp

display_message PROC
    mov ah, 09h
    int 21h
    ret
display_message ENDP


output_in_binary proc
    
    mov bx, 2
print_binary:
    mov dx, 0  
    div bx  
     
    push dx  
    test ax, ax
    jnz print_binary
mov cx,0
print_stack:
    pop dx  ; Pop the binary digit from stack
    add dl, '0' 
    mov ah, 02h
    int 21h
    inc cx  ; Increase counter
    cmp cx, 16  ; Assuming 16 bits for the input
    jne print_stack
    ret
output_in_binary endp



.data
    Enter_Message db 10, 13, "Enter No in Decimal: $"
    Output_Message db 10, 13, "Output In Binary is: $"
    illegal_message db 10, 13, "Illegal Input, Try Again$"
end main