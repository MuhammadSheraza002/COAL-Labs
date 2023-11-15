.model small
.stack 100h
.386
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display a question mark '?'
    mov dl, '?'
    mov ah, 02
    int 21h

    ; Read the first decimal digit
    mov al, 31h
    int 21h
    mov dl,al
    mov ah, 02
    int 21h
    
    mov bl, al  ; Save the first digit

    ; Read the second decimal digit
    mov ah, 39h
    int 21h
    mov dl,al
    mov ah, 02
    int 21h


main endp

end main