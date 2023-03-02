.586
.MODEL FLAT, STDCALL
includelib kernel32.lib
includelib user32.lib

ExitProcess PROTO : DWORD
MessageBoxA PROTO : DWORD, : DWORD, : DWORD, : DWORD

.STACK 4096

.CONST

.DATA
myIntArr	BYTE	0, 2, 3, 4, 5, 6, 7
STR1		DB		"����� ������ ���������, 2 ����, 4 ������", 0
STR2		DB		"� ������� ���� 0 �������...", 0
STR3		DB		"� ������� ��� 0 ��������...", 0

myBytes		BYTE	10h, 20h, 30h, 40h
myWords		WORD	8Ah, 3Bh, 44h, 5Fh, 99h
myDoubles	DWORD	1, 2, 3, 4, 5, 6
myPointer	DWORD	myDoubles

.CODE
main PROC
variant15:														; EAX = ?, EDX = ?
	mov EBX, myPointer											; �������� ��������� �� ������
	mov EAX, [EBX + 4]											; ������ ������� �������
	mov EDX, [EBX + 8]											; ������ ������� �������

mov esi, offset myIntArr										; ������ �� ������ myIntArr
mov ecx, lengthof myIntArr										; ����� ������� myIntArr � �������
xor al, al														; ��������� �������� EAX

sumArray: 
	add al, [esi]												; �������� ������ ������� �������
	add esi, type myIntArr										; ������� �� ��������� ������� �������
loop sumArray													; ���� ���� ������� �� ����� 0

mov ecx, lengthof myIntArr										; ����� ������� � �������
mov ebx, 1														; �������� 1 � ebx (�� �������)

cycle:
	cmp [myIntArr + ECX - 1], 0									; ��������� ���������� ��� �������� ������� � 0
	jne false													; � ������ 0 ��������� � false

mov ebx, 0														; � ������ 1 ��������� ���� � �������� ebx (�� �������)
invoke MessageBoxA, 0, offset STR2, offset STR1, 20				; ����� MessageBoxA
jmp endprocess													; ��������� � endprocess

false:
	loop CYCLE													; ���������� ����


invoke MessageBoxA, 0, offset STR3, offset STR1, 20				; ���� ��� 0 ��������


endprocess:														; ���������� ��������
	push 0
	call ExitProcess

main ENDP
end main