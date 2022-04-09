section .text ; our code is always in the .text section 
    global do_Str               ; makes the function appear in global scope 
    extern printf               ; tell linker that printf is defined elsewhere ; (not used in the program) 

do_Str:                         ; functions are defined as labels
    push rbp                    ; save Base Pointer (bp) original value 
    mov rbp, rsp                ; set base pointer to point on function frame 
    mov rcx, rdi                ; get function argument 
    ;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE STARTS HERE ;;;;;;;;;;;;;;;; 
    mov r10, 0                  ; initialize answer 
    label_here:
        mov al, [rcx]
        sub al, 'a'
        cmp al, 'z'-'a'
        jbe to_uppercase

        mov al, [rcx]
        sub al, 'A'
        cmp al, 'Z'-'A'
        jbe next_char

        cmp byte [rcx], ')'
        je change_right_bracket
        
        cmp byte [rcx], '('
        je change_left_bracket

        jmp inc_non_letter_counter

    next_char: 
        inc rcx                 ; increment pointer 
        cmp byte [rcx], 0       ; check if byte pointed to is zero (is compare -> ZF=1)
        jnz label_here          ; keep looping until it is null terminated 
    ;;;;;;;;;;;;;;;; FUNCTION EFFECTIVE CODE ENDS HERE ;;;;;;;;;;;;;;;; 
    mov rsp, rbp 
    pop rbp 
    jmp reverse_string

    to_uppercase:
        and byte [rcx], 11011111b
        jmp next_char
    change_left_bracket:
        mov byte [rcx], 111100b
        jmp inc_non_letter_counter
    change_right_bracket:
        mov byte [rcx], 111110b
        jmp inc_non_letter_counter
    inc_non_letter_counter:
        inc r10
        jmp next_char

    reverse_string:
        mov rsi, rsp 
        push 0
        mov rcx, rdi
        reverse_readloop_beg:
            mov al,	[rdi]
            inc rdi
            cmp al, 0
            je 	reverse_storeloop_beg
            push rax
            jmp reverse_readloop_beg
        reverse_storeloop_beg:
            pop rax
            cmp al, 0
            je reverse_storeloop_end
            mov	[rcx], al
            inc rcx
            jmp reverse_storeloop_beg
        reverse_storeloop_end:
            mov rsp, rsi
            mov rax, r10
            ret