; Unidentified routine.
CODE_80B432:
	sep #$30
	lda.b #$00
CODE_80B436:
	tax
	lda.w $2F40,x
	beq CODE_80B44E
	cmp.b #$10
	bcs CODE_80B444
	cmp.b $14
	bcs CODE_80B457
CODE_80B444:
	and.b #$3F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra CODE_80B436
