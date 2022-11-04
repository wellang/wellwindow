





default rel

global main

extern glfwWindowShouldClose
extern glfwPollEvents
extern glfwSwapBuffers
extern glViewport
extern glfwMakeContextCurrent
extern glfwCreateWindow
extern glfwInit


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        call    glfwInit
        mov     r8d, 0
        mov     ecx, 0
        lea     rax, [rel L_003]
        mov     rdx, rax
        mov     esi, 600
        mov     edi, 800
        call    glfwCreateWindow
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    glfwMakeContextCurrent
        mov     ecx, 600
        mov     edx, 800
        mov     esi, 0
        mov     edi, 0
        call    glViewport
        jmp     L_002

L_001:  mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    glfwSwapBuffers
        call    glfwPollEvents
L_002:  mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    glfwWindowShouldClose
        test    eax, eax
        jz      L_001
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_003:
        db 74H, 65H, 73H, 74H, 00H


SECTION .note.gnu.property align=8

        db 04H, 00H, 00H, 00H, 20H, 00H, 00H, 00H
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H
        db 02H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
        db 01H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H


