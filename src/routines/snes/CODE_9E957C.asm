; Unidentified routine.
CODE_9E957C:
	lda.b d1
	pha
	lda.b d0
	pha
	lda.b d3
	ldx.b d1
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b d1
	lda.b d2
	ldx.b d0
	jsl.l CODE_808FEB
	ldx.b a3
	lda.b $08
	clc
	adc.b d1
	sta.b d1
	lda.b $0A
	adc.b $AB
	sta.b $AB
	bpl CODE_9E95AE
	jmp.w CODE_9E9784
