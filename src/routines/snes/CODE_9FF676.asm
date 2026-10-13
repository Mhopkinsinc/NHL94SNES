; Unidentified routine.
CODE_9FF676:
	ldx.b $BB
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	jsr.w $F992
	bne CODE_9FF690
	lda.w #$0008
	tsb.b $C3
	bra CODE_9FF6A6
