.model small
.stack 100h
.386
.code
main proc
    mov ax, @data
    mov ds, ax
    mov dx,offset Enter_Message
    call display_message
    mov cx, 4
    call input_in_decimal
    mov dx, offset Output_Message
    call display_message
    mov cx, 16
    MOV AX,BX
    MOV BX,2
    call output_in_binary
    mov ah, 4ch
    int 21h

main endp

display_message PROC
    mov ah, 09h
    int 21h
    ret
display_message ENDP


input_in_decimal PROC
    mov bx, 0      ; Clearing BX register
    mov cx, 4      ; Count of digits to input

input_loop:
    mov ah, 01h    ; Input a character from keyboard
    int 21h
    sub al, 30h    ; Convert ASCII to numeric value
    cmp al, 9      ; Check if the input is a valid digit
    ja illegal_input ; If not, jump to illegal_input
    rol bx, 4      ; Shift BX to the left by 4 (to make space for the next digit)
    or bl, al      ; Place the new digit into the lowest 4 bits of BL
    loop input_loop ; Repeat for the specified number of digits

    ret

illegal_input:
    mov dx, offset illegal_message
    call display_message
    jmp main        ; Restart the program

input_in_decimal ENDP

output_in_binary PROC
    mov cx, 4      ; Number of bits to output

output_loop:
         ; Clear DX register for quotient
     ; Move the decimal number to AX register
    div bx
    ADD DL,'0'
    MOV DL,AH         ; Divide AX by 2
    mov ah, 02    ; Display the character in DL
    int 21h
    DEC CX        ; Push remainder (either 0 or 1) onto stack
    loop output_loop ; Repeat for all the bits


output_in_binary ENDP



.data
    Enter_Message   db 10, 13, "Enter a 4-digit number in Decimal: $"
    Output_Message  db 10, 13, "Output In Binary is: $"
    illegal_message db 10, 13, "Illegal Input, Try Again$"
end main