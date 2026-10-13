; Unidentified routine.
CODE_9FCCF5:
	sta.b $A5
	jsl.l CODE_9FCB68
CODE_9FCCFB:
	stx.b $87
	ldx.w #$000E
CODE_9FCD00:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FCD00
	ldx.b $87
	rtl
