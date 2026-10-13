; Unidentified routine.
CODE_9B8CE1:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CF6
	jsr.w $8D4D
	bra CODE_9B8D20
