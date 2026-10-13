; Unidentified routine.
checkfornewpen:
	lda.w sfhormode
	beq CODE_9EB1ED
	jmp.w $B2B4
