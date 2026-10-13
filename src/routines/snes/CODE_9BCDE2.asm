; Unidentified routine.
CODE_9BCDE2:
	sep #$30
	lda.b #$00
	sta.l $7E34F4
	ldx.b #$0F
	lda.b #$1E
CODE_9BCDEE:
	sta.l $7E34F4,x
	dex
	bne CODE_9BCDEE
	rep #$30
	rtl
