; Unidentified routine.
CODE_9F9EC6:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	ldx.b $89
	lda.l $7E3568,x
	cmp.w #$0003
	bne CODE_9F9F34
	lda.w #$0005
	sta.l $7E3568,x
	lda.l $7E3578,x
	sec
	sbc.l $7E3588,x
	bit.w #$8000
	beq CODE_9F9F02
	eor.w #$FFFF
	inc a
CODE_9F9F02:
	cmp.w #$0002
	bcs CODE_9F9F77
	lda.w gsp
	cmp.w #$0004
	bne CODE_9F9F20
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F9F77
	inc a
	sta.l $7E3578,x
	bra CODE_9F9F77
