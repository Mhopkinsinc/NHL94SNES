; Unidentified routine.
CODE_9BA13C:
	lda.w $0C2B,x
	cmp.w #$000E
	bne CODE_9BA149
	stz.w $0C2B,x
	bra CODE_9BA106
