.586
.MODEL FLAT, STDCALL
includelib kernel32.lib
includelib user32.lib

ExitProcess PROTO : DWORD
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

.STACK 4096

.CONST

.DATA
MB_OK EQU 0
STR1 DB "Вторая лабораторная работа", 0
STR2 DB "Результат сложения чисел =  ", 0
BUF DB 1
HW DD ?

.CODE
main PROC
sumNumbers: 
	mov al, 1h
	add al, 2h

outputMessage:
	mov ebx, LENGTHOF STR2 - 2
	add al, 30h
	mov [STR2 + ebx],  al

	INVOKE	MessageBoxA, HW, OFFSET STR2, OFFSET STR1, MB_OK

push 0
call ExitProcess

main ENDP
end main
