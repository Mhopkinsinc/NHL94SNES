; Wait until every standard pad (low nibble 0) has no button down
WaitPadsRelease:
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
