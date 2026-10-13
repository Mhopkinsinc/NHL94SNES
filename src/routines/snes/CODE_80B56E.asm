; Unidentified routine.
CODE_80B56E:
	ldx.b $0A
	stz.b $0B
	lda.b $14
	sta.b $16
CODE_80B576:
	lda.b $16
	sec
	sbc.w $2F40,x
	beq CODE_80B5AA
	bmi CODE_80B58E
	sta.b $16
	lda.b #$C8
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra CODE_80B576
