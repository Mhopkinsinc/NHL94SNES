; Unidentified routine.
CODE_9FCB4F:
	dey
	dey
	bpl CODE_9FCB56
	ldy.w #$0008
CODE_9FCB56:
	dec.b $14
	bne CODE_9FCB3E
	plx
CODE_9FCB5B:
	rtl
