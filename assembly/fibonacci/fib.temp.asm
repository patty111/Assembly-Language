; Testing Colors	(colors.asm)

; Testing SetTextColor and GetTextColor.

INCLUDE c:\Users\Patrick\.vscode\extensions\istareatscreens.masm-runner-0.4.3\native\irvine\Irvine32.inc

.data
str1 BYTE "Sample string, in color",0dh,0ah,0

.code
main PROC

	mov	ax,yellow + (blue * 16)
	call	SetTextColor
	
	mov	edx,OFFSET str1
	call	WriteString
	
	call	GetTextColor
	call	DumpRegs

	exit
main ENDP

END main