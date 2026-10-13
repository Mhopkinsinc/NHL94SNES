; Unidentified routine.
CODE_8086BD:
	pha
	lda.w $0AD3
	cmp.w #$000F
	beq CODE_8086CA
	jsl.l CODE_9F96E6
CODE_8086CA:
	sep #$20
	lda.b #$0F
	sta.w $0762
	rep #$20
	pla
	rtl
