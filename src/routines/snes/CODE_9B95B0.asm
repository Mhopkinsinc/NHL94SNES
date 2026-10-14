; Unidentified routine.
CODE_9B95B0:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $97
	lda.w #$313C
	sta.b $95
	lda.w #$0000
	sta.w printy
	pha
CODE_9B95DB:
	cmp.w $1DC1
	beq CODE_9B95F3
CODE_9B95E0:
	jsr.w CODE_9B95F5
	lda.b $95
	clc
	adc.w #$0006
	sta.b $95
	inc.w printy
	pla
	inc a
	pha
	bra CODE_9B95DB
