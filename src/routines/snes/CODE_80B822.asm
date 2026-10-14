; Unidentified routine.
CODE_80B822:
	lda.w $2F40,x
	and.b #$40
	beq .t1
	lda.b #$08
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra CODE_80B822

.t1:
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	txa
	clc
	adc.b $16
	tay
	and.b #$07
	beq .1
	lda.w $2F40,y
	bmi .1
	clc
	adc.b $16
	sta.b $16
.1:
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
