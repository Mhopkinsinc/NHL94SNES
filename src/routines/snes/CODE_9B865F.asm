; Unidentified routine.
CODE_9B865F:
	phx
	pha
	ldx.w $0AC6
CODE_9B8664:
	lda.w JoyPad,x
	bne CODE_9B8664
	pla
	plx
	rtl
