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
STR1		DB		"Яшный Никита Сергеевич, 2 курс, 4 группа", 0
STR2		DB		"В массиве есть 0 элемент...", 0
STR3		DB		"В массиве нет 0 элемента...", 0

myBytes		BYTE	10h, 20h, 30h, 40h
myWords		WORD	8Ah, 3Bh, 44h, 5Fh, 99h
myDoubles	DWORD	1, 2, 3, 4, 5, 6
myPointer	DWORD	myDoubles

.CODE
main PROC
variant15:														; EAX = ?, EDX = ?
	mov EBX, myPointer											; добавили указатель на массив
	mov EAX, [EBX + 4]											; второй элемент массива
	mov EDX, [EBX + 8]											; третий элемент массива

mov esi, offset myIntArr										; ссылка на массив myIntArr
mov ecx, lengthof myIntArr										; длина массива myIntArr в счётчик
xor al, al														; зануление регистра EAX

sumArray: 
	add al, [esi]												; добавили первый элемент массива
	add esi, type myIntArr										; перешли на следующий элемент массива
loop sumArray													; цикл пока счётчик не равен 0

mov ecx, lengthof myIntArr										; длина массива в счётчик
mov ebx, 1														; помещаем 1 в ebx (по заданию)

cycle:
	cmp [myIntArr + ECX - 1], 0									; поочерёдно сравниваем все элементы массива с 0
	jne false													; в случае 0 переходим к false

mov ebx, 0														; в случае 1 переходим сюда и зануляем ebx (по заданию)
invoke MessageBoxA, 0, offset STR2, offset STR1, 20				; вывод MessageBoxA
jmp endprocess													; переходим к endprocess

false:
	loop CYCLE													; продолжаем цикл


invoke MessageBoxA, 0, offset STR3, offset STR1, 20				; если нет 0 элемента


endprocess:														; завершение програмы
	push 0
	call ExitProcess

main ENDP
end main