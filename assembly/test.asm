include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
text BYTE "I am a good man, who are you?", 0
len BYTE $ - text - 1

.code
main PROC
    mov EDX, OFFSET text
    movzx ECX, len

    L1:
        movzx ESI, len
        sub ESI, ECX

        movzx EAX, text[ECX-1]
        call WRITECHAR

    loop L1

    exit
main ENDP
END main