; Unidentified routine.
CODE_808CBF:
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
	tay
.1:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs .3
	lda.b $18
	asl a
	tax
	phy
	lda.b $0C
	pha
	jsl.l CODE_808950
	pla
	sta.b $0C
	ply
.2:
	lda.b $0C
	clc
	adc.b $24
	sta.b $0C
	tya
	clc
	adc.w #$0020
	tay
	inc.b $1E
	lda.b $1E
	cmp.w #$0020
	bne .1x
	tya
	clc
	adc.w $079E
	tay
.1x:
	dec.b $1A
	bne .1
	rtl
.3:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	tax
	lda.b $0C
	pha
	phy
	jsl.l CODE_808950
	ply
	lda.b $18
	asl a
	sec
	sbc.b $20
	tax
	phy
	tya
	adc.w #$0400
	and.w #$FFE0
	tay
	jsl.l CODE_808950
	ply
	pla
	sta.b $0C
	jmp.w .2
