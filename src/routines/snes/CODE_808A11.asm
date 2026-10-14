; Unidentified routine.
CODE_808A11:
	sta.b $16
	lda.w $0761
	bmi .t1
.1:
	jmp.w CODE_808A11

.t1:
	cpx.w #$0020
	bcc .2
.1x:
	txa
	and.w #$001F
	tax
	lda.w $079C
	clc
	adc.w #$0400
	sta.w $079C
.2:
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
.loop:
	lda.b [$0C],y
	clc
	adc.b $16
	ora.b $14
	sta.w VMDATAL
	iny
	iny
	dex
	bne .loop
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
	bne .2
.1:
	txa
	clc
	adc.w $079E
	tax
.2:
	dec.b $1A
	bne CODE_808A5E
	rtl
