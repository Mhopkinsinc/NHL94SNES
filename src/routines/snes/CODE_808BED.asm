; Unidentified routine.
CODE_808BED:
	cpx.w #$0020
	bcc CODE_808C01
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
CODE_808C01:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	asl a
	pha
	ldx.b $26
	jsl.l Mul16U
	asl.b $24
	lda.w $0761
	bmi CODE_808C1C
	jmp.w CODE_808CBF
