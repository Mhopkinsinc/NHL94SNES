; Unidentified routine.
CODE_80AA7B:
	phy
	tya
	asl a
	tax
	phx
	lda.b $5C
	beq CODE_80AAAF
	bmi CODE_80AAB9
	lda.w $090A,y
	clc
	adc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	plx
	sec
	sbc.w $095A,x
	sta.b $5E
	sep #$20
	lda.b $5C
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.w $095A,x
	sta.b $5A
	bra CODE_80AAF3
