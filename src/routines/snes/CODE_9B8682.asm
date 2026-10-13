; Unidentified routine.
CODE_9B8682:
	phx
	pha
CODE_9B8684:
	ldx.w #$0008
CODE_9B8687:
	lda.w JoyPad,x
	bit.w #$000F
	bne CODE_9B8694
	and.w #$FFF0
	bne CODE_9B8684
CODE_9B8694:
	dex
	dex
	bpl CODE_9B8687
	pla
	plx
	rtl
