; Unidentified routine.
CODE_9FF6A9:
	ldx.b $BB
	bne .1
	lda.b $83
	cmp.b $BF
	bmi .2
.1:
	lda.b d5
	sta.b $B7
.2:
	jmp.w CODE_9FF898
