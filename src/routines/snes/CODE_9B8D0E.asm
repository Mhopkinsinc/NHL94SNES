; Unidentified routine.
CODE_9B8D0E:
	lda.b $A5
	inc a
CODE_9B8D11:
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	dec.b $95
	jsr.w $8D32
CODE_9B8D20:
	lda.b $A5
	clc
	adc.w $1D9F
	sbc.w $1D8B
	sta.b $95
	lda.w $1D8F
	jsr.w $8D7C
	rts
