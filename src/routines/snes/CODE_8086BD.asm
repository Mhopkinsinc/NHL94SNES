; Unidentified routine.
CODE_8086BD:
	pha
	lda.w $0AD3
	cmp.w #$000F
	beq .1
	jsl.l CODE_9F96E6
.1:
	sep #$20
	lda.b #$0F
	sta.w $0762
	rep #$20
	pla
	rtl
