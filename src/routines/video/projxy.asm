; Project a rink position to screen coordinates
projxy:
	lda.w sfhormode
	beq .t1
	lda.b d0
	pha
	lda.b d1
	eor.w #$FFFF
	inc a
	sta.b d0
	pla
	sec
	sbc.w #tmp0
	sta.b d1
	bra CODE_9BC138

.t1:
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
	bmi .t1
	cmp.w #a2
	bpl .t1
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
	bmi .t1
	cmp.w #a2
	bpl .t1
	lda.w #$0070
	sec
	sbc.b d1
	sta.b d1
	rtl

.t1:
	lda.w #$4E20
	sta.b d1
	rtl
