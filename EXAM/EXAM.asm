.model small
.stack
.data
.code
main 	proc
	mov cx,3
    mov ah,2
    mov dl,'A'
    mov bl,'3'
	
q:  int 21H
    push dx
    mov dl,bl
    int 21H
    pop dx
    inc dl
    dec bl
    loop q

		
main 	endp
end		main