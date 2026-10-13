; Unidentified routine.
CODE_9B9917:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$0000
	sta.b $97
	lda.w #$163E
	sta.b $95
	lda.w #$0000
	sta.w printy
	pha
CODE_9B9942:
	cmp.w $1DC1
	beq CODE_9B995D
CODE_9B9947:
	jsr.w $995F
	lda.b $95
	clc
	adc.w #$0004
	sta.b $95
	inc.w printy
	inc.w printy
	pla
	inc a
	pha
	bra CODE_9B9942
