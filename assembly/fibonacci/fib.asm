include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.code
main PROC
    mov ecx,0
    push 10             ; calculate the nth fib
    call fib            ; calculate fib (eax)
    add esp, 4          ; clean up the stack

    call WriteDec
    call Crlf
    exit
main ENDP

fib PROC C
    add ecx,1
    push ebp
    mov  ebp,esp
    sub  esp, 4         ; space for a local dword [ebp-4]
    mov  eax,[ebp+8]    ; get n

    ; if ((n == 1) || (n == 2)) return 1;
    cmp  eax,2          ; n == 2?
    je   exception2
    cmp  eax,1          ; n == 1?
    je   exception2

    ;else return fib(n-1) + fib(n-2);
    dec eax
    push eax            ; Fib(n-1)
    call fib
    mov [ebp-4], eax    ; store first result

    dec dword ptr [esp] ; (n-1) on the stack -> (n-2)
    call fib
    add esp, 4          ; clean up stack

    add eax, [ebp-4]    ; add result and stored first result

    jmp Quit

exception2:
    mov eax, 1          ; start values: 1, 1
    ; dec eax           ; start values: 0, 1
Quit:
    mov esp, ebp        ; restore esp
    pop ebp             ; restore ebp

    ret                 ; return EAX, stack not cleaned up
fib ENDP

END main