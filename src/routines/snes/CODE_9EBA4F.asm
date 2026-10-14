; Unidentified routine.
CODE_9EBA4F:
	jsl.l CODE_9EBA68
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CODE_9EBA68
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
CODE_9EBA67:
	rtl
