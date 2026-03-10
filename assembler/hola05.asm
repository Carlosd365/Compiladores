; Hola Muundo! version 4
; creado por: Carlos
; fecha: 26/02/2026
; compilar con: nasm -f elf hola04.asm
; vincular con: ld -m elf_i386 hola04.o -o holamundo04

%include	'stdio32.asm'

SECTION .data
	msg1	db	'Hola mundo sin ENTER!',0
	msg2	db	'Esta cadena despues del hola',0
	msg3	db	'Esta cadena en nueva linea', 0

SECTION .text
global _start

_start:
	; ------- printStr(msg) ----------
	mov	eax, msg1
	call	printStr

	mov	eax, msg2
	call	printStrLn

	mov	eax, msg3
	call	printStrLn

	call	quit
