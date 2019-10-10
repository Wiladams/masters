format ELF64 executable 3

segment readable executable

entry main

main:
    lea rdi, [msg]      ; address of message in rdi
    mov rax, 15         ; length goes into rax register
    mov     rdx, rax    ; move rax into rdx register
    mov     rsi, rdi    ; move rdi to rsi
    mov     rdi, 1      ; stdout
    mov     rdx, 1      ; sys_write call
    syscall             ; make system call
    xor     rdi, rdi    ; clear rdi to 0
    mov     rax, 60     ; call sys_exit
    syscall
    
segment readable writable

msg     db 'Hello World!', 13, 10, 0 
