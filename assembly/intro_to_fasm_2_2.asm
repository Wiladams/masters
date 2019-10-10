; From tutorial: https://blog.brakmic.com/intro-to-x86-assembly-with-fasm-part-2/
format PE console

entry _start

include 'fasm/include/win32a.inc'
; Constants
str_fmt:    db "The result is %d",0

;define layout of PE/COFF binary
section '.text' code readable executable

_incr:
    push    ebp
    mov     ebp, esp

    mov     ecx, [ebp+8]
    inc     ecx
    mov     eax, ecx

    mov     esp, ebp
    pop     ebp
    ret

_start:
    push    ebp
    mov     ebp, esp

    mov     eax, 10
    push    eax


    call    _incr

    add     esp, 4

    push    eax

    push    str_fmt

    call    [printf]

    add     esp, 8
    push    0


    mov     esp, ebp
    pop     ebp

    call    [ExitProcess]

; Import section
section '.idata' import data readable

library kernel32, 'kernel32.dll', \
    msvcrt, 'msvcrt.dll'

import kernel32, \
    ExitProcess, 'ExitProcess'

import msvcrt, \
    printf, 'printf'
