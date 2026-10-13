; Unidentified routine.
CODE_80B7C7:
	sep #$30
	lda.w $2F40,x
	and.b #$40
	bne CODE_80B822
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	clc
	adc.b $00
	tay
	and.b #$07
	beq CODE_80B7E9
	lda.w $2F40,y
	bmi CODE_80B7E9
	clc
	adc.b $16
	sta.b $16
CODE_80B7E9:
	txa
	and.b #$07
	beq CODE_80B80E
	lda.w $2FB9,x
	bmi CODE_80B80E
	tay
	lda.w $2F40,y
	bmi CODE_80B80E
	clc
	adc.b $16
	sta.w $2F40,y
	tya
	adc.w $2F40,y
	tax
	tya
	sta.w $2FB9,x
	rep #$30
	plb
	ply
	plx
	rtl
