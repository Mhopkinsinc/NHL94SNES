; Unidentified routine.
CODE_9FF6A9:
	ldx.b $BB
	bne CODE_9FF6B3
	lda.b $83
	cmp.b $BF
	bmi CODE_9FF6B7
CODE_9FF6B3:
	lda.b $B9
	sta.b $B7
CODE_9FF6B7:
	jmp.w CODE_9FF898
