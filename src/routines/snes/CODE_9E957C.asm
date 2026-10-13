; Unidentified routine.
CODE_9E957C:
	lda.b $A9
	pha
	lda.b $A5
	pha
	lda.b $B1
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b $A9
	lda.b $AD
	ldx.b $A5
	jsl.l CODE_808FEB
	ldx.b $95
	lda.b $08
	clc
	adc.b $A9
	sta.b $A9
	lda.b $0A
	adc.b $AB
	sta.b $AB
	bpl CODE_9E95AE
	jmp.w $9784
