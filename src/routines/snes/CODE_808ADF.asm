; Unidentified routine.
CODE_808ADF:
	stx.b $1C
	sty.b $1E
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	tax
	lda.b $1E
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $079C
	ora.b $1C
	tay
	lda.w $0761
	bmi .t1
	jmp.w CODE_808B96

.t1:
	sep #$20
	lda.b $0E
	sta.w A1B1
	lda.b #$01
	sta.w DMAP1
	lda.b #$18
	sta.w BBAD1
	rep #$20
CODE_808B1F:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808B5F
	lda.b $18
	asl a
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
CODE_808B35:
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	txa
	clc
	adc.b $18
	adc.b $18
	tax
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1
	tya
	clc
	adc.w $079E
	tay
.1:
	dec.b $1A
	bne CODE_808B1F
	rtl
