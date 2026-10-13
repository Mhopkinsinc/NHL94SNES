; Unidentified routine.
CODE_80B52C:
	sep #$30
	lda.b #$00
CODE_80B530:
	tax
	lda.w $2F40,x
	beq CODE_80B565
	cmp.b #$08
	bne CODE_80B55B
	stx.b $0A
CODE_80B53C:
	sta.b $2A
	txa
	clc
	adc.w $2F40,x
	tax
	lda.w $2F40,x
	beq CODE_80B552
	cmp.b #$10
	bcs CODE_80B552
	clc
	adc.b $2A
	bra CODE_80B53C
