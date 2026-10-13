; Unidentified routine.
CODE_9D8330:
	jsl.l GetPlayerCount
	lda.b $A5
	sta.b $B5
	ldx.w #$0000
CODE_9D833B:
	stx.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC5FC
	lda.b $A5
	sta.b $AD
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	sec
	sbc.b $AD
	sta.b $A5
	ldy.b $91
	lda.w $1E45,y
	clc
	adc.b $A5
	sta.w $1E45,y
	stx.b $B1
	jsl.l CODE_9D8372
	inx
	cpx.b $B5
	bmi CODE_9D833B
	rtl
