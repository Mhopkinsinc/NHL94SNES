; Unidentified routine.
CODE_9F9EB7:
	phx
	ldx.b a0
	lda.l $7E3568,x
	cmp.w #$0004
	bcc .t3
	jmp.w CODE_9F9F8F

.t3:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	ldx.b a0
	lda.l $7E3568,x
	cmp.w #$0003
	bne .t2
	lda.w #$0005
	sta.l $7E3568,x
	lda.l $7E3578,x
	sec
	sbc.l $7E3588,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	cmp.w #$0002
	bcs CODE_9F9F77
	lda.w gsp
	cmp.w #$0004
	bne .t1
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F9F77
	inc a
	sta.l $7E3578,x
	bra CODE_9F9F77

.t1:
	lda.w #$0003
	sta.l $7E3568,x
	lda.l $7E3598,x
	ora.w #$0002
	sta.l $7E3598,x
	bra CODE_9F9F77

.t2:
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
