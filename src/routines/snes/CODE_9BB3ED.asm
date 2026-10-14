; Unidentified routine.
CODE_9BB3ED:
	ldx.w #$0C3F
CODE_9BB3F0:
	stx.b $0C
	sty.b $10
CODE_9BB3F4:
	lda.b $0C
	clc
	adc.b $10
	ror a
	cmp.b $0C
	beq CODE_9BB418
	pha
	tax
	jsl.l Mul16U
	lda.b d0
	cmp.b $08
	lda.b $A7
	sbc.b $0A
	bcs CODE_9BB413
	pla
	sta.b $10
	bra CODE_9BB3F4
