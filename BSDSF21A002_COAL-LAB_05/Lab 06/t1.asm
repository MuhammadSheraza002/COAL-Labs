.model small 
.stack 100h
.386
.code
main proc
               mov ax,@data
               mov ds,ax
               mov dx,offset Enter_Message
               mov ah,09
               int 21h
               mov cx,0
               call get_input
               call decrement_cx
               mov dx,offset Output_Message
               call Message_print
               mov ch,16
               call Output_manage
               MOV dx,offset Enter_Message_binary
               call Message_print
               mov cx,0
               mov ax,0
               call input_hexa
               MOV dx,offset Output_Message_hexa
               call Message_print
               call output_hexa
               mov ah,4ch
               int 21h
               main endp


    output_hexa proc
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
               jnz output_hexa
               ret
               output_hexa endp
    Print9:    
               add al,30h     
               mov dl,al     
               mov ah,02
               int 21h
               dec cx
               jnz output_hexa
               


    input_hexa proc
               mov ah,01
               int 21h
               cmp al,0dh
               je end_
               call valid_input_hexa
               
               sub al,30h
               or  bl,al
               cmp cx,15
               je end_
               shl bx,1
               inc cx
               jne input_hexa
               end_:
                inc cx
                ret
                input_hexa endp


    valid_input_hexa PROC
        cmp al,'1'
        jg try_again_hexa
        cmp al,'0'
        jl try_again_hexa
        ret 
        valid_input_hexa endp
        
    try_again_hexa proc
    mov dx,offset wong_input
    call Message_print
    jmp main
    try_again_hexa ENDP




    Message_print proc
    mov ah,09
    int 21H
    ret
    Message_print endp


    decrement_cx proc
    cmp cx,4
    jl stop
    dec cx
    stop:
    ret
    decrement_cx endp
    get_input proc
               mov ah,01
               int 21h
               call valid_input
               cmp al,0dh
               je end__
               sub al,30h
               or  bl,al
               cmp cx,3
               je end__
               shl bx,4
               inc cx
               jne get_input
               end__: 
                inc cx
                ret
                get_input endp
            
    


    valid_input proc
        cmp al,61h
        je try_again
        cmp al,7Ah
        je try_again
        ret 
        valid_input endp

    try_again proc
    mov dx,offset wong_input
    call Message_print
    jmp main


    Output_manage proc
               call Output
               ret
               Output_manage endp 
    

    Output proc     
               shl bx,1
               jc  One
               mov dl,30h
               mov ah,02
               int 21h
               dec ch
               jnz Output
               ret 
               Output endp

    One proc       
               mov dl,31h
               mov ah,02
               int 21h
               dec ch
               jnz Output
               ret
               One endp




.data
    wong_input db 10,13,"Illegal iNPUT try Again: $"
    Enter_Message  db 10,13,"Enter No in HexaDecimal 0 to FFFF: $"
    Output_Message db 10,13,"Output in Binary is: $"
    Enter_Message_binary  db 10,13,"Enter No in binary: $"
    new_line db 10,13,"$"
    Output_Message_hexa db 10,13,"Output in hexa is: $"




end main