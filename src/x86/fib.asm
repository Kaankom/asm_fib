global _start
extern printf

section .data
    start_msg db "Fibonacci Sequence:", 0x0a
    fib_num_format db "%d", 0x0a, 0x00

section .text
_start:
    call printMessage
    call initFib
    call fibLoop
    call exit

printMessage:
    mov rax, 1
    mov rdi, 1
    mov rsi, start_msg
    mov rdx, 20
    syscall
    ret

printNumber:
    push rax
    push rbx
    mov rdi, fib_num_format
    mov rsi, rbx
    call printf
    pop rbx
    pop rax
    ret

initFib:
    xor rax, rax
    xor rbx, rbx
    inc rbx
    ret
   
fibLoop:
    call printNumber
    add rax, rbx
    xchg rax, rbx
    cmp rbx, 10
    js fibLoop
    ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall


