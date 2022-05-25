.model small
.stack
.data
.code
main 	proc
		
		mov ah, 2
		mov bx,1	;Starting Iteration
		mov cx, 5	;Rows
		
outer:	push cx
		mov cx,bx	
		
inner:	mov dl,'X'
		int 21h
		
		inc dl
		loop inner
		
		mov dl,10d	;Line Break
		int 21h
		mov dl,13d	;Carriage return
		int 21h
		
		inc bx		;Increase number of iterations by 1
		pop cx
		
		loop outer
		
		mov ah,4ch
		int 21h
main 	endp
end		main