; Unidentified routine.
CODE_9F9F34:
	lda.l $7E3568,x
	inc a
	sta.l $7E3568,x
	lda.l $7E3528,x
	sta.b d0
	lda.l $7E3538,x
	sta.b d1
	jsl.l CODE_9F9F91
	ldx.b a0
	lda.l $7E3578,x
	clc
	adc.b d0
	sta.l $7E3578,x
	lda.l $7E3538,x
	sta.b d0
	lda.l $7E3528,x
	sta.b d1
	jsl.l CODE_9F9F91
	ldx.b a0
	lda.l $7E3588,x
	clc
	adc.b d0
	sta.l $7E3588,x
CODE_9F9F77:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
CODE_9F9F8F:
	plx
	rtl
