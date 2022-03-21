section .text
global add1

add1:
    mov rax, rdi
    add rax, rsi
    ret