; Unidentified routine.
CODE_808DED:
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
	ldx.b $22
	ldy.w #$0000
CODE_808E08:
	lda.b [$0C]
	and.w #$00FF
	beq CODE_808E1C
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dex
	bne CODE_808E08
CODE_808E1B:
	rtl
