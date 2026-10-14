; Wait until every pad that has a side ($1C84) has no button down
WaitSidePadsRelease:
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
