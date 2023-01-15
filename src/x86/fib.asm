global _start

section .data
    start_msg db "Fibonacci Sequence:", 0x0a

section .text
_start:
    ; print start_message to stdout
    mov rax, 1
    mov rdi, 1
    mov rsi, start_msg
    mov rdx, 20
    syscall

    xor rax, rax
    xor rbx, rbx
    inc rbx
   
fibLoop:
    add rax, rbx
    xchg rax, rbx

    push rax
    push rbx

    mov rax, 1
    mov rdi, 1
    mov rsi, [rsp+0x0a]
    mov rdx, 1
    syscall

    pop rbx
    pop rax

    cmp rbx, 10
    js fibLoop

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall


