; Look for a new penalty call and stop play when it should be called
checkfornewpen:
	lda.w sfhormode
	beq CODE_9EB1ED
	jmp.w CODE_9EB2B4
