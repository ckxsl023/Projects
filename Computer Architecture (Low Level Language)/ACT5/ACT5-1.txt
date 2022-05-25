.model small ;Add clear screen
.stack
.data
row	db	12
col	db	40
.code

main	proc
		mov ax,@data
		mov ds,ax
		
ulit:	mov ah,2
		mov bh,0
		mov dh,row
		mov dl,col
		int 10h
		
		mov ah,2
		mov dl,219
		int 21h	

		mov ah,0
		int 16h		; al=char input
		
		cmp al,25d	;right arrow key
		je right
		cmp al,40h	;left arrow key
		je left
		cmp al,40h	;up arrow key
		je up
		cmp al,40h	;down arrow key
		je down
		cmp al,1 	;esc scan code
		je exit
		jmp ulit
right:	inc col
		jmp ulit
		
left:	dec col
		jmp ulit
up:		dec row
		jmp ulit
down:	inc row
		jmp ulit

exit: 	mov ah,4ch
		int 21h
		
main	endp
end		main
