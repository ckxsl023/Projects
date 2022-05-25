.model small
.stack
.data
newline db 0ah, 0dh, '$'
prompt db "Enter a number: $"
prompt2 db "Enter a character: $"
prompt3 db "Continue(y/n)? $"
.code

main 	proc
		mov ax,@data
		mov ds,ax
	Back:
		push dx
		mov ah,9
		mov dx,offset newline
		int 21h
		pop dx
		
		
		push dx
		mov ah,9
		mov dx,offset prompt
		int 21h
		
		mov ah,1
		int 21h	
		mov ah,00
		sub bx,30h
		
		cmp al, '1'
		jge x
		
		jmp Back
	x:
		cmp al, '9'
		jle y
		
		push dx
		mov ah,9
		mov dx,offset newline
		int 21h
		pop dx
		
		jmp Back
	y:
		push ax
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset newline
		int 21h
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset prompt2
		int 21h
		push ax
		mov ah,1
		int 21h
		mov ah,00
		pop dx
		
		push dx
		mov ah,9
		mov dx,offset newline
		int 21h
		pop dx
		
		mov ah,2
		mov dl,al
		pop cx
		sub cx,30h		
		rpt: int 21h
		loop rpt
		
		
		push dx
		mov ah,9
		mov dx,offset newline
		int 21h
		pop dx
		
	rpt2:
		push dx
		mov ah,9
		mov dx,offset prompt3
		int 21h
		
		mov ah,1
		int 21h
		pop dx
		
		
		cmp al, 'y'
		je Back
		
		cmp al, 'n'
		je exit
		jmp rpt2
		
	exit:
		mov ah, 4ch
		int 21h
		
main	endp
end		main