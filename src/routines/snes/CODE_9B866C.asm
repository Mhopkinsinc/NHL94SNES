; Unidentified routine.
CODE_9B866C:
	phx
	pha
.loop:
	ldx.w #$0008
.loop2:
	lda.w $1C84,x
	beq .1
	lda.w JoyPad,x
	bne .loop
.1:
	dex
	dex
	bpl .loop2
	pla
	plx
	rtl
