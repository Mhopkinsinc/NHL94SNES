; Unidentified routine.
CODE_9B8CC4:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CDB
	dec.b $95
	jsr.w CODE_9B8D32
	bra CODE_9B8D20
