.model small
.stack
.data
	string1 db 'Cristan Kim Xavier S. Lansang$' ; $-indicator the end of the string
.code
main	proc
		mov ax,@data ;Assign indirectly
		mov ds,ax

		mov ah,6
		mov al,0
		mov bh,00010011b
		mov ch,0
		mov cl,0
		mov dh,24
		mov dl,79
		int 10h
		
		mov ah,6	;Draw Box Position
		mov al,0
		mov bh,01110110b
		mov ch,5	;y-pos
		mov cl,15	;x-pos
		mov dh,10	;Height
		mov dl,60	;Length
		int 10h
		
		;DRAW BORDER
		;At (5,15)
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,5 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,201d	;Display corner-left
		int 21h		;Display character
	
		mov ah,9
		mov al,205d
		mov bh,0
		mov bl,01110011b
		mov cx,44
		int 10h	
		
		;At (5,60)
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,5 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,187d	;Display corner-right
		int 21h		;Display character
		
		;At (10,15)
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,10 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,200d	;Display corner-left
		int 21h		;Display character
		
		mov ah,9
		mov al,205d
		mov bh,0
		mov bl,01110011b
		mov cx,44
		int 10h	
		
		;At (10,60)
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,10 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,188d	;Display corner-right
		int 21h		;Display character
		
		;DRAW BORDER LEFT SIDE
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,6 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display border-left
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,7 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display border-left
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,8 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display border-left
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,9 	;row
		mov dl,15 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display border-left
		int 21h		;Display character
		
		;DRAW BORDER RIGHT SIDE
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,6 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display right-border
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,7 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display right-border
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,8 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display right-border
		int 21h		;Display character
		
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov dh,9 	;row
		mov dl,60 	;column
		int 10h
		
		mov ah,2 	;Call set curor position parameters
		mov dl,186d	;Display right-border
		int 21h		;Display character
		
		;PRINT STRING
		mov ah,2	;set cursor position (parameters)
		mov bh,0
		mov bl,11110011b
		mov dh,7 	;row
		mov dl,23 	;column
		int 10h
		
		mov ah,9
		mov dx, offset string1	;Display string1
		int 21h
		
		mov ah,4ch
		int 21h
main 	endp
end		main