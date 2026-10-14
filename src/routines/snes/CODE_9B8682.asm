; Unidentified routine.
CODE_9B8682:
	phx
	pha
.loop:
	ldx.w #$0008
.loop2:
	lda.w JoyPad,x
	bit.w #$000F
	bne .1
	and.w #$FFF0
	bne .loop
.1:
	dex
	dex
	bpl .loop2
	pla
	plx
	rtl
