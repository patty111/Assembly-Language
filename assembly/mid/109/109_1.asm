INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    NUM1 DWORD 00001234H, 56780000H
    NUM2 DWORD 0ABCD0000H,0EF123456H
    NUM3 DWORD 3 DUP (?) 


.code

main PROC
    mov NUM3, 0
    mov NUM3+4, 0
    mov EDX, NUM1;tmp
    add EDX, NUM2
    jc carry1

    mov NUM3, EDX
    jmp highbit


    carry1:
        cmp NUM1, NUM2
        jb carry2
        mov EDI, 0FFFFFFFFH
        sub EDI, NUM1
        add NUM1, 1
        sub NUM1, NUM2

        add NUM3+4, 1
        add NUM3, NUM1
        jmp highbit

    carry2:
        jmp high

    highbit:
        





    exit
main ENDP
END main