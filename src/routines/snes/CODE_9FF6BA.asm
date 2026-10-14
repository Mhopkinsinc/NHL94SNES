; Unidentified routine.
CODE_9FF6BA:
	lda.b $BB
	bne CODE_9FF6CA
	lda.w #$0000
	jsl.l CODE_80A200
	jsr.w CODE_9FF8DC
	bra CODE_9FF6CD
