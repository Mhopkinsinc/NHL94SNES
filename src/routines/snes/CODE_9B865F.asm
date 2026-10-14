; Unidentified routine.
CODE_9B865F:
	phx
	pha
	ldx.w $0AC6
.loop:
	lda.w JoyPad,x
	bne .loop
	pla
	plx
	rtl
