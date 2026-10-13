; Unidentified routine.
CODE_9B866C:
	phx
	pha
CODE_9B866E:
	ldx.w #$0008
CODE_9B8671:
	lda.w $1C84,x
	beq CODE_9B867B
	lda.w JoyPad,x
	bne CODE_9B866E
CODE_9B867B:
	dex
	dex
	bpl CODE_9B8671
	pla
	plx
	rtl
