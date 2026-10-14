; Unidentified routine.
CODE_9FCCF5:
	sta.b d0
	jsl.l CODE_9FCB68
CODE_9FCCFB:
	stx.b xsave
	ldx.w #$000E
CODE_9FCD00:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9FCD00
	ldx.b xsave
	rtl
