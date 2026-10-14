; Unidentified routine.
CODE_9FB504:
	lda.w #$0258
	sta.w $1003,y
	txa
	lsr a
	sta.w $1043,y
CODE_9FB50F:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
CODE_9FB517:
	rtl
