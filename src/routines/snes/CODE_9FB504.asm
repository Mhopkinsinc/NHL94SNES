; Unidentified routine.
CODE_9FB504:
	lda.w #$0258
	sta.w temp1,y
	txa
	lsr a
	sta.w temp3,y
CODE_9FB50F:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
CODE_9FB517:
	rtl
