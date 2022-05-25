data	segment
x		dw		3
y 		dw		4
myname	db		'Cristan Kim Xavier$'
data 	ends
code 	segment
start: 	mov ax, seg data
		mov ds,ax
		mov ax, ds:[x]
		add ax, ds:[y]
		
		mov dx,offset myname
		mov ah, 9H
		mov al, 24H
		int 21H
		
		mov ah,4ch
		int 21h
code	ends
		end start