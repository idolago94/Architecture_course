section .text
global add_long

add_long:
    push rbp
    mov rbp, rsp
    push rax

    ;;; concat low values
    add rsi, 8
    add rdi, 8
    mov eax, [rsi]
    add [rdi], eax
    jc inc_high

    ;;; concat high values
    sub rsi, 8
    sub rdi, 8
    high_calc:
        mov eax, [rsi]      ; eax = num high value
        adc [rdi], eax
    
    pop rax
    mov rsp, rbp
    pop rbp
    ret

inc_high:
    sub rsi, 8
    sub rdi, 8
    mov r8, 1
    add [rdi], r8
    jmp high_calc