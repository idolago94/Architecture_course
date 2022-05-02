section .text
global str2long

str2long:
    push rbp
    mov rbp, rsp

    ;;; backup registers in use
    push rcx
    push rdx
    push rax
    push rbx

    mov rcx, rdi ; rcx = str
    mov rdx, rsi ; rdx = num(struct very_long)
    mov r8, 0
    
    label_here:
        inc r8

        cmp r8, 9
        je to_high

        ;;; shift left 4 bits
        mov eax, [rdx]
        shl eax, 4
        mov [rdx], eax

    cont:
        mov rax, 0
        mov al, [rcx]   
        sub al, '0'
        cmp al, '9'-'0' ; check if the char is digit
        jbe is_digit

        mov rax, 0
        mov al, byte[rcx]   ; save current char at al
        sub al, 87      ; convert char to hex
        add [rdx], al   ; add hex value to the result
 
    next_char:
        inc rcx             ; increment pointer to next char
        cmp byte[rcx], 0    ; check is end of string
        jne label_here   

    cmp r8, 9
    ; sub r9, 9
    jb to_low

    end: 
        ;;; restore regiters in use
        pop rcx
        pop rdx
        pop rax
        pop rbx

        mov rsp, rbp
        pop rbp
        ret

is_digit:
    mov al, [rcx]
    sub al, 48
    add [rdx], al
    jmp next_char

to_high:
    add rdx, 8
    jmp cont

to_low: 
    mov rax, [rdx]
    mov r8, 0
    mov [rdx], r8
    add rdx, 8
    mov [rdx], rax
    jmp end