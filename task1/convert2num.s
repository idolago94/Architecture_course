section .text
global convert2num

convert2num:
    push rbp
    mov rbp, rsp
    push rcx
    push rsi
    mov rsi, rdi
    mov rax, 0
    dec rsi
    mov ecx, -1
length:
    inc rsi
    cmp byte[rsi], 0
    loopnz length, ecx
    not ecx
    ; ecx is the length of the string
    dec ecx
    mov eax, ecx
next:
    dec rsi
    mov dh, al
    mov dl, [rsi]
    sub dl, '0'
    mul dl
    add ecx, eax
    mov al, 10
    mul dh
    cmp rdi, rsi
    jne next
end:
    pop rdx
    pop rsi
    pop rcx
    ret