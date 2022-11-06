section .data

	str: db '%s', 10, 0

	 width: dw 1280
	 height: dw 720;   	string~ WINDOW_NAME = 'TEST'
 
	 WINDOW_NAME: db 'TEST', 0
	.len: equ $- WINDOW_NAME;   	string~ init_error = 'TEST RAN INTO A INIT ERROR!'
 
	 init_error: db 'TEST RAN INTO A INIT ERROR!', 0
	.len: equ $- init_error;  	string~ loop_error = 'TEST RAN INTO A LOOP ERROR!'
 
	 loop_error: db 'TEST RAN INTO A LOOP ERROR!', 0
	.len: equ $- loop_error
	 GL_COLOR_BUFFER_BIT: dw 0x00004000
	 GL_DEPTH_BUFFER_BIT: dw 0x00000100
	pFourF: dd 0.4

	zeroF: dd 0.0

	oneF: dd 1.0

	threeF: dd 3.0

	section .bss

	window: resq 1 

section .text

%macro move 2

	mov %2, %1

%endmacro
%macro movef 2

	movss %2, %1

%endmacro
%macro pop 1

	pop %1

%endmacro
%macro add 2

	add %2, %1

%endmacro
%macro sub 2

	sub %2, %1

%endmacro
%macro xor 2

	xor %2, %1

%endmacro
%macro return 1

	move  60, rax
	move  %1, rdi;          syscall

	syscall
%endmacro

section .text


mloop:

	jmp mloop.loop

	.loop:

	move  [rel window], rdi
	call glfwWindowShouldClose

	cmp rax, 0
	jne mloop._33_1rax0_neq
	je mloop._33_1_fin
	._33_1rax0_neq:
	move  str, r8
	move  init_error, r9
	jmp mloop._2print_
	jmp mloop._2print_fin
	._2print_:;  	move~ r8, rdi
 	mov rdi, r8;  	move~ r9, rsi
 	mov rsi, r9;   	move~ 0, rax
 	mov rax, 0
	call printf

	ret

	jmp mloop._2print_fin
	._2print_fin:

	return  1
	jmp mloop._33_1_fin
	._33_1_fin:
	jmp mloop.loop1

	.loop1:

	movef  [rel zeroF], xmm0
	movef  [rel zeroF], xmm1
	movef  [rel pFourF], xmm2
	movef  [rel oneF], xmm3
	call glClearColor

	move  GL_COLOR_BUFFER_BIT, rdi
	call glClear

	move  [rel window], rdi
	call glfwSwapBuffers

	call glfwPollEvents

	jmp mloop.loop

init:

	call glfwInit

	cmp rax, 0
	je init._62_1rax0_eq
	jne init._62_1_fin
	._62_1rax0_eq:
	move  str, r8
	move  init_error, r9
	jmp init._2print_
	jmp init._2print_fin
	._2print_:;  	move~ r8, rdi
 	mov rdi, r8;  	move~ r9, rsi
 	mov rsi, r9;   	move~ 0, rax
 	mov rax, 0
	call printf

	ret

	jmp init._2print_fin
	._2print_fin:

	return  1
	jmp init._62_1_fin
	._62_1_fin:
	move  0, r8
	move  0, rcx
	move  WINDOW_NAME, rdx
	move  width, rdi
	move  height, rsi
	call glfwCreateWindow

	cmp rax, 0
	je init._78_2rax0_eq
	jne init._78_2_fin
	._78_2rax0_eq:
	move  str, r8
	move  init_error, r9
	jmp init._4print_
	jmp init._4print_fin
	._4print_:;  	move~ r8, rdi
 	mov rdi, r8;  	move~ r9, rsi
 	mov rsi, r9;   	move~ 0, rax
 	mov rax, 0
	call printf

	ret

	jmp init._4print_fin
	._4print_fin:

	return  1
	jmp init._78_2_fin
	._78_2_fin:
	move  rax, [rel window]
	move  [rel window], rdi
	call glfwMakeContextCurrent

	move  0, rdi
	move  0, rsi
	move  width, rdx
	move  height, rcx
	call glViewport

	jmp mloop.loop

	return  0

global main

main:
	
	extern printf

	extern glfwInit

	extern glfwCreateWindow

	extern glfwMakeContextCurrent

	extern glfwWindowShouldClose

	extern glfwPollEvents

	extern glViewport

	extern glfwSwapBuffers

	extern glClear

	extern glClearColor

	call init

	return  0
