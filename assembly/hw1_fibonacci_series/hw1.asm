include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
fib DWORD 0, 1, 30 DUP (?)
num DWORD ?

.code
main PROC

    call READDEC
    mov num, EAX
    ;don't write num-2 !!!
    mov ECX, num      ;loop counter  num-2
    sub ECX, 2        ; -2

    ;set index = 2(first two are set to 0, 1 already)
    mov EBX, TYPE fib * 2       

    L1:
        mov EAX, fib[EBX - TYPE fib * 2]
        add EAX, fib[EBX - TYPE fib]
        mov fib[EBX], EAX
        add EBX, 4
    loop L1

    ;output : n = 0~24
    mov ECX, num        ;loop counter
    L2:
        mov EDX, num    
        sub EDX, ECX
        mov EAX, fib[EDX*TYPE fib]
        call WRITEDEC
        call crlf
    loop L2


    exit
main ENDP
END main