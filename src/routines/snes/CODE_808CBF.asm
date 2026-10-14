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
CODE_808CDB:
	lda.b $18
	clc
	adc.b $1C
	cmp.w #$0021
	bcs CODE_808D16
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
CODE_808CF5:
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
	bne .1
	tya
	clc
	adc.w $079E
	tay
.1:
	dec.b $1A
	bne CODE_808CDB
	rtl
