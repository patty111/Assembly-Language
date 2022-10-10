include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data                           ;data decleration
firstval DWORD 123
secondval DWORD 201
thirdval DWORD 1001
sum SDWORD 0

.code                           ;code decleration

main PROC                       ;main method starts
    mov EBX, firstval
    add EBX, secondval
    add EBX, thirdval
    add sum, EBX
    sub sum, 2000
    mov EAX, sum 
    
    call WriteInt
    mov EAX, firstval

    call crlf   ;\n
    call WriteInt

    exit                        ;Exit program
main ENDP
END main