section .data
	par db "Par",0x0A
	parLen equ $ - par
	impar db "Impar",0x0A
	ipLen equ $ - impar
	vec dd 1,2,3,4,5
	vecLen equ ($ - vec) / 4
section .text
	global _start

_start:
	
	mov rcx, 0
loop_start:
	cmp rcx, vecLen
	jge loop_end
	mov rax, [vec + rcx * 4]

	push rcx

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
	pop rcx
	inc rcx
	jmp loop_start
loop_end:
	mov rax, 60
	mov rdx, 0
	syscall
