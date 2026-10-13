; Unidentified routine.
CODE_808E7C:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $1C
	tax
	lda.b $22
	asl a
	jsl.l Mul16U
	lda.b $20
	asl a
	clc
	adc.b $08
	adc.w #$0006
	adc.b $0C
	sta.b $0C
CODE_808EAE:
	ldx.b $18
	ldy.w #$0000
CODE_808EB3:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_808EB3
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $1C
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne CODE_808EAE
	rtl
