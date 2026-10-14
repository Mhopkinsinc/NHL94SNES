; Unidentified routine.
CODE_9D8330:
	jsl.l GetPlayerCount
	lda.b d0
	sta.b d4
	ldx.w #$0000
CODE_9D833B:
	stx.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC5FC
	lda.b d0
	sta.b d2
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	sec
	sbc.b d2
	sta.b d0
	ldy.b a2
	lda.w $1E45,y
	clc
	adc.b d0
	sta.w $1E45,y
	stx.b d3
	jsl.l CODE_9D8372
	inx
	cpx.b d4
	bmi CODE_9D833B
	rtl
