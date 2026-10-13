; Unidentified routine.
CODE_9EF319:
	lda.w $15D6
	beq CODE_9EF328
	stz.w $0E01
	stz.w puckvx
	stz.w puckvy
	rtl
