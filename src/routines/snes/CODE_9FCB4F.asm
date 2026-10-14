; Unidentified routine.
CODE_9FCB4F:
	dey
	dey
	bpl .1
	ldy.w #$0008
.1:
	dec.b $14
	bne CODE_9FCB3E
	plx
CODE_9FCB5B:
	rtl
