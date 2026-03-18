section .data
	vec dd 2, 1, 4, 3, 5
	vecLen equ ($ - vec) / 4

section .text

global _start

_start:
	xor rcx, rcx
loop1_s:
	cmp rcx, vecLen
	jge loop1_e

	mov r12d, [vec + 4 * rcx]

	mov rbx, rcx
	inc rbx
loop2_s:
	cmp rbx, vecLen
	jge loop2_e

	mov r13d, [vec + 4 * rbx]

	cmp r12d, r13d
	jg swap
	inc rbx
	jmp loop2_s
swap:
	mov [vec + 4*rcx], r13d
	mov [vec + 4*rbx], r12d
	mov r12d, [vec + 4 * rcx]
	inc rbx
	jmp loop2_s
loop2_e:
	inc rcx
	jmp loop1_s
loop1_e:
	xor rcx, rcx
loop_start:
	cmp ecx, vecLen
	jge loop_end
	mov ebx, vec
	
	mov eax, ecx
	mov edi, 4
	mul edi

	add ebx, eax

	mov edi, [ebx]
	add edi, '0'

	mov [toCh], dil

	push rcx

	mov rax, 1
	mov rdi, 1
	mov rsi, toCh
	mov rdx, 1
	syscall

	pop rcx
	inc rcx
	jmp loop_start
loop_end:
	mov [toCh], byte 0x0A
	mov rax, 1
	mov rdi, 1
	mov rsi, toCh
	mov rdx, 1
	syscall

	mov rax, 60
	mov rdx, 0
	syscall

section .bss
	toCh resb 1