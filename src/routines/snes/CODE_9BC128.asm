; Unidentified routine.
CODE_9BC128:
	lda.b d0
	sec
	sbc.w Hpos
	sta.b d0
	lda.b d1
	sec
	sbc.w Vpos
	sta.b d1
CODE_9BC138:
	lda.b d0
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #a2
	bpl CODE_9BC16E
	lda.b d0
	clc
	adc.w #$0080
	sta.b d0
	lda.b d2
	asl a
	clc
	adc.b d2
	pha
	asl a
	pla
	ror a
	clc
	adc.b d1
	sta.b d1
	cmp.w #$FF6F
	bmi CODE_9BC16E
	cmp.w #a2
	bpl CODE_9BC16E
	lda.w #$0070
	sec
	sbc.b d1
	sta.b d1
	rtl
