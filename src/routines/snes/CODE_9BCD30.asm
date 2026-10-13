; Unidentified routine.
CODE_9BCD30:
	ldx.w #$000F
CODE_9BCD33:
	lda.w #$001E
	sta.b $A5
	jsl.l CODE_9CA41B
	sep #$20
	lda.b $A5
	sta.l $7E34F4,x
	rep #$30
	dex
	bpl CODE_9BCD33
	rtl
