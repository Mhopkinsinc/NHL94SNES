; Unidentified routine.
CODE_808A1B:
	cpx.w #$0020
	bcc CODE_808A2F
CODE_808A20:
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
CODE_808A2F:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	asl a
	pha
	ldx.b $26
	jsl.l Mul16U
	asl.b $24
	lda.b $0C
	clc
	adc.w #$0006
	adc.b $24
	adc.b $08
	sta.b $0C
	pla
	sta.b $24
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tax
CODE_808A5E:
	stx.w VMADDL
	phx
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808AA1
	ldx.b $18
	ldy.w #$0000
CODE_808A71:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne CODE_808A71
CODE_808A80:
	lda.b $0C
	clc
	adc.b $24
	sta.b $0C
	pla
	clc
	adc.w #$0020
	tax
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne CODE_808A9C
CODE_808A96:
	txa
	clc
	adc.w $079E
	tax
CODE_808A9C:
	dec.b $1A
	bne CODE_808A5E
	rtl
