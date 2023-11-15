.model small 
.stack 100h
.386
.code
main proc
            mov ax,@data
            mov ds,ax
            mov ch,25
            mov dx,offset Enter_Message
            mov ah,09
            int 21h
            mov si,offset string
            
        input_loop:
            mov ah,01
            int 21h
            cmp al,0dh
            je Output
            mov [si],al
            inc si
            dec ch
            CMP CH,30h
            jne input_loop
            je Output

        Output:
            mov bl,25
            sub bl,ch
            mov ch,bl
            mov si,offset string
            jmp Output_loop
        
        Output_loop:
            mov dx,offset new_line
            mov ah,09
            int 21h
            mov dl,[si]
            MOV AH,02
            INT 21H
            mov dl,offset space
            MOV AH,09
            INT 21H
            mov dl,offset equal
            MOV AH,09
            INT 21H            
            mov cl,8
            MOV bl,[si]
            
        print_binary:
               shl bl,1
               jc  One
               mov dl,30h
               mov ah,02
               int 21h
               dec cl
               jnz print_binary
               jmp Hexadecimal
        One:       
               mov dl,31h
               mov ah,02
               int 21h
               dec cl
               jnz print_binary
               jmp Hexadecimal

        Hexadecimal:
            MOV DL,offset b_char
            MOV AH,09
            INT 21H
            MOV DL,offset space
            MOV AH,09
            INT 21H
            MOV DL,offset equal
            MOV AH,09
            INT 21H
            mov cl,2
            mov bl,[si]
            jmp print_Hexadecimal
        print_Hexadecimal:
            rol bl,4
            mov al,bl
            and al,0fh
            cmp al,9
            jle  Print_less_9
            add al, 55
            mov dl,al
            mov ah,02
            int 21h
            dec cl
            cmp cl,0
            je control_loop
            jne print_Hexadecimal

    Print_less_9:    
               add al,30h     
               mov dl,al     
               mov ah,02
               int 21h
               dec cl
               jnz print_Hexadecimal
               jmp control_loop 

    control_loop:
        MOV DL,offset h_char
        MOV AH,09
        INT 21H
        inc si
        dec ch
        jnz Output_loop
        jmp exit

    exit:      
        mov ah,4ch
        int 21h

        
        
main endp
.data
    new_line  db 10,13,"$"
    Enter_Message  db 10,13,"Enter Message of Max 25 length String: $"
    Output_Message db 10,13,"Output String is: $"
    string db 25 dup(?)
    equal db "= $"
    b_char db "b$"
    h_char db  "h$"
    space db " $"
    
end main