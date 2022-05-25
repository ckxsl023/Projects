		ASSUME CS:CODE, DS:DATA
DATA 	SEGMENT
X		DW		?
Y		DW 		5
NAM		DW		2 DUP(?)		;[BP+6] --> N
DATA 	ENDS
CODE 	SEGMENT
_Fibo	PROC					;[BP+4] --> CODE SEGMENT
		PUSH BP					;[BP+2] -->IP
		MOV BP,SP				;[BP]	--> OLD BP
		SUB SP,2				;[BP-2]	--> p
		MOV WORD PTR [BP-2],1
L0:		CMP WORD PTR [BP+6],1
		JE	L1
		MOV AX,[BP-2]			;Move to AX the value to multiply
		MUL	WORD PTR [BP+6]		;Multiplies AX to N 
		MOV [BP-2],AX
		DEC WORD PTR [BP+6]		;Decrement N
		JMP L0
		MOV AX,[BP-2]			;Return Value to AX
L1:	
		ADD SP,2
		POP BP
		RETN
_Fibo	ENDP
_MAIN	PROC
		PUSH BP					;[BP+2] -->IP
		MOV BP,SP				;[BP]	--> OLD BP
		SUB SP,4				;[BP-4] --> Because it needs for bytes for two variables
		MOV AX, SEG DATA		
		MOV DS,AX
		MOV	WORD PTR [BP-2],4	;Assign Value 4 to P
		MOV	AX,4				;Copy to AX before multiply
		MUL Y					;AX Will store the result
		ADD AX,[BP-2]			;ADD [BP-2] to AX
		MOV	[BP-4], AX			;COPY AX to Q or [BP-4]
		PUSH [BP-4]
		CALL _Fibo
		ADD SP,2
		MOV X,AX				;Add fibo value to X
		MOV AX,0
		ADD SP,4
		POP BP
		RETF
_MAIN	ENDP
CODE 	ENDS
		END		_MAIN