; Unidentified routine.
CODE_9D9BC0:
	cmp.w #$0040
	bne CODE_9D9BCE
	lda.l $9C963E
	and.w #$00FF
	bra CODE_9D9BF1
