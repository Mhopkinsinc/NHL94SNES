; Unidentified routine.
CODE_9FF64D:
	ldx.b $BB
	bne CODE_9FF667
	lda.b $D9
	clc
	adc.w #$000C
	sta.b $D9
	sta.b $DB
	cmp.w #$0100
	bpl CODE_9FF667
	lda.w #$0040
	tsb.b $C3
	bra CODE_9FF673
