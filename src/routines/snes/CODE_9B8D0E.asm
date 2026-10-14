; Unidentified routine.
CODE_9B8D0E:
	lda.b d0
	inc a
CODE_9B8D11:
	sta.b a3
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	dec.b a3
	jsr.w CODE_9B8D32
CODE_9B8D20:
	lda.b d0
	clc
	adc.w $1D9F
	sbc.w $1D8B
	sta.b a3
	lda.w $1D8F
	jsr.w CODE_9B8D7C
	rts
