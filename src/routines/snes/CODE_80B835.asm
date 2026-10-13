; Unidentified routine.
CODE_80B835:
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	txa
	clc
	adc.b $16
	tay
	and.b #$07
	beq CODE_80B84F
	lda.w $2F40,y
	bmi CODE_80B84F
	clc
	adc.b $16
	sta.b $16
CODE_80B84F:
	lda.b $16
	sta.w $2F40,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
