; Bloque de funcion de estrada-salida estandar de 32 bits
; creado por: Carlos
; fecha: 26/02/2026



; --------------------- Calculo de Tamaño de Cadena ------------------------

strLen:
	push 	ebx		; guardar en pila el contendio de ebx
        mov     ebx, eax	; ebx = direccion de msg

sigChar:
        cmp     byte [eax], 0   ; si [eax] == NULL
        jz      finConteo
        inc     eax
        jmp     sigChar

finConteo:

        sub     eax, ebx        ; eax -= ebx
	pop	ebx
	ret

; ---------------------- printStr(eax = Cadena) ---------------------------
printStr:
	push	edx			; edx a pila
	push	ecx			; ecx a pila
	push	ebx			; ebx a pila
	push	eax			; eax a pila (es la direccion de cadena)

	call	strLen			; llamada a calculo de longitud de cadena
					; la longitud se devuelve en eax

	mov     edx, eax                ; edx = 12 (Numero de caracteres)
        pop     ecx	                ; ecx = msg (direccion de cadena)
        mov     ebx, 1                  ; escribe al STDOUT_file
        mov     eax, 4                  ; invocar a SYS_WRITE
        int     80h

	pop	ebx			; extraer pila de ebx
	pop	ecx			; extraer pila de ecx
	pop	edx			; extraer pola de edx
	ret


;---------------------- printStrLn(eax = Cadena) ---------------------------
printStrLn:
	call	printStr		; impresion de cadena
	push	eax			; resguardar eax
	mov	eax, 0Ah		; eax = 0Ah (ENTER)
	push	eax			; colocar el valor de eax en pila
	mov	eax, esp		; eax = Puntero de pila $$
	call	printStr
	pop	eax
	pop	eax
	ret


; -------------------- Salida al sistema --------------------------------
quit:
	mov	ebx, 0		; return 0
	mov	eax, 1		; invoca SYS_EXIT
	int	80h
