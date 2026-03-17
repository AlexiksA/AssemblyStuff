section .data
	par db "Par",0x0A
	parLen equ $ - par
	impar db "Impar",0x0A
	ipLen equ $ - impar

section .text
	global _start

_start:
	mov rax, 3
	and rax, 1

	mov rax, 1
	mov rdi, 1

	jz l1
	mov rsi, impar
	mov rdx, ipLen
	jmp l2
l1:
	mov rsi, par
	mov rdx, parLen
l2:
	syscall

	mov rax, 60
	mov rdi, 0
	syscall