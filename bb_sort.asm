section .data
	vec dd 3, 2, 1, 5, 4
	vecLen equ ($ - vec) / 4

section .text

global _start

_start:
	xor rcx, rcx
loop1_s:
	cmp rcx, vecLen
	jge loop1_e

	mov r12, [vec + 4 * rcx]

	mov rbx, rcx
	inc rbx
loop2_s:
	cmp rbx, vecLen
	jge loop2_e

	mov r13, [vec + 4 * rbx]

	cmp r12, r13
	jl swap
	inc rbx
	jmp loop2_s
swap:
	mov [vec + 4*rcx], r13
	mov [vec + 4*rbx], r12
	mov r12, [vec + 4 * rcx]
	inc rbx
	jmp loop2_s
loop2_e:
	inc rcx
	jmp loop1_s
loop1_e:
	xor rcx, rcx
loop_start:
	cmp rcx, vecLen
	jge loop_end
	mov rbx, vec
	add rbx, [rcx] * 4

	push rcx

	mov rax, 1
	mov rdi, 1
	mov rsi, rbx
	mov rdx, 4
	syscall

	pop rcx
	inc rcx
	jmp loop_start
loop_end:
	mov rax, 60
	mov rdx, 0
	syscall
