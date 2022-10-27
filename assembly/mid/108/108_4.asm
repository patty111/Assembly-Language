INCLUDE Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data


.code

main PROC
    mov DX, 20
    mov CX, 0;count
    mov EAX, 0;add

    L1:
        cmp CX, DX
        je quit
        movzx EBX, CX
        add EAX, EBX
        inc CX
        jmp L1

    quit:
        call WRITEDEC


    exit
main ENDP
END main