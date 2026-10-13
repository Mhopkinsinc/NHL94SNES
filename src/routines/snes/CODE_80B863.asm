; Unidentified routine.
CODE_80B863:
	sep #$30
	lda.w $3032,x
	and.b #$7F
	sta.b $16
	clc
	adc.b $00
	tay
	lda.w $3032,y
	bmi CODE_80B87A
	clc
	adc.b $16
	sta.b $16
CODE_80B87A:
	lda.w $3093,x
	bmi CODE_80B89A
	tay
	lda.w $3032,y
	bmi CODE_80B89A
	clc
	adc.b $16
	sta.w $3032,y
	tya
	adc.w $3032,y
	tax
	tya
	sta.w $3093,x
	rep #$30
	plb
	ply
	plx
	rtl
