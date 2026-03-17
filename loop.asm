section .text
	global _start

_start:
	mov rcx, 9
	mov rax, '1'

l1:
	push rcx ; salvez rcx-ul inainte de syscall
	mov [num], rax ; salvez in num valoarea din rax
	mov rax, 1
	mov rdi, 1	; ma pregatesc sa fac
	mov rsi, num ;sys_write(unsigned int fd, const char* buf, size_t count) - 1
	mov rdx, 1
	syscall

	mov rax, [num]
	sub rax, '0'
	inc rax			; incrementez pe raxie cu 1 safely
	add rax, '0'
	pop rcx ; readuc rcx-ul
	loop l1

	mov byte [num], 0x0A

	mov rax, 1
	mov rdi, 1
	mov rsi, num
	mov rdx, 1
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

section .bss
num resb 1