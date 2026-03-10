; Hola Muundo! version 4
; creado por: Carlos
; fecha: 26/02/2026
; compilar con: nasm -f elf hola04.asm
; vincular con: ld -m elf_i386 hola04.o -o holamundo04

%include	'stdio32.asm'

SECTION .data
	msg1	db	'Hola mundo con archivo de cabecera!',0Ah	; cadena msg = 'Hola mundo!'
	msg2	db	'¿Quien encuantra el error?',0Ah

SECTION .text
	global _start

_start:
	; ------- printStr(msg) ----------
	mov	eax, msg1
	call	printStr

	mov	eax, msg2
	call	printStr

	call	quit
