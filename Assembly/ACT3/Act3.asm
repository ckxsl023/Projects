.model small
.stack
.data
.code
main 	proc
		
		mov ah,1 
		mov dl,'1'
		mov cx,3	;Counter
		mov ah,2
		mov dl,'A'
		mov bl,'1' 
		
outer:	int 21h
		push dx
		push cx
		
		mov cx,3	;Counter 2
		mov dl,'1'
inner:	int 21h
		inc dl		;Increment value of 1 in dl
		loop inner
		
		mov dl, '*'
		int 21h
		
		pop cx
		pop dx
		inc dl		;Increment up, change value stored inside 'A' to 'B' to 'C'
		loop outer	;Once Done
		
		mov ah,4ch
		int 21h
		
main 	endp
end		main