; Unidentified routine.
CODE_9F9298:
	ldx.b $89
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F92C3
	jsl.l RandomWord
	and.w #$0001
	ldx.b $89
	pha
	clc
	adc.l $7E3578,x
	sta.l $7E3578,x
	pla
	eor.w #$0001
	adc.l $7E3588,x
	sta.l $7E3588,x
CODE_9F92C3:
	lda.w #$0005
	sta.l $7E3568,x
	rtl
