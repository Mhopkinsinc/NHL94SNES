; Unidentified routine.
CODE_9F9A94:
	ldx.b $08
	bne CODE_9F9A9E
	tax
	lda.w #$000A
	bra CODE_9F9AA2
