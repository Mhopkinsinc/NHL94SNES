; Unidentified routine.
CODE_9F9A67:
	lda.b $A9
	bpl CODE_9F9A94
	eor.w #$FFFF
	inc a
	ldx.b $08
	bne CODE_9F9A79
	tax
	lda.w #$000A
	bra CODE_9F9A7D
