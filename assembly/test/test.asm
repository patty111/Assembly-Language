include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode

.data
arr DWORD 1, 2, 3

.code

main PROC
    mov EAX, arr
    call WriteInt
    call clrf
    xchg EAX, arr+1
    call WriteInt
    call clrf
    xchg EAX, arr+2
    call WriteInt
    call clrf

    exit
main ENDP
END main