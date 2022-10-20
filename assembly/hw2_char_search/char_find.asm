;please write a program to find a character from a string
;procedure of the program:
;1. send a prompt, ask to enter a string its length  15
;2. send a prompt(or message), ask the char to find
;3. search the string. If character in string, output its index. If not, output: "Character not in string"

include Irvine32.inc
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

text BYTE 100 DUP (?)
prompt BYTE "Enter a string which length is greater than 15: ", 0
charprompt BYTE "Enter a character to find its index(index start from 0): ", 0
notfound BYTE "Char not in string...", 0

.code
main PROC
    mov EDX, OFFSET prompt
    call WRITESTRING
    mov EDX, OFFSET text
    mov ECX, 100
    call READSTRING
    
    mov EDX, OFFSET charprompt
    call WRITESTRING
    call READCHAR       ;auto store in AL
    call crlf

    mov ECX, LENGTHOF text  ;loop count
    mov ESI, 0  ;index count

    L1:
        cmp text[ESI], AL ;if char in string
        je equal
        inc ESI
    loop L1

    cmp ESI, LENGTHOF text  ;not in string
    je notEqual
    jmp quit
    
    equal:
        mov EAX, ESI
        call WRITEDEC
        mov EAX, " "
        call WRITECHAR
        inc ESI
        jmp L1
    notEqual:
        mov EDX, OFFSET notfound
        call WRITESTRING
    quit:

    exit
main ENDP
END main