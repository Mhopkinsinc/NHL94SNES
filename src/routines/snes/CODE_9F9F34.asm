; Unidentified routine.
CODE_9F9F34:
	lda.l $7E3568,x
	inc a
	sta.l $7E3568,x
	lda.l $7E3528,x
	sta.b $A5
	lda.l $7E3538,x
	sta.b $A9
	jsl.l CODE_9F9F91
	ldx.b $89
	lda.l $7E3578,x
	clc
	adc.b $A5
	sta.l $7E3578,x
	lda.l $7E3538,x
	sta.b $A5
	lda.l $7E3528,x
	sta.b $A9
	jsl.l CODE_9F9F91
	ldx.b $89
	lda.l $7E3588,x
	clc
	adc.b $A5
	sta.l $7E3588,x
CODE_9F9F77:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9F9F8F:
	plx
	rtl
