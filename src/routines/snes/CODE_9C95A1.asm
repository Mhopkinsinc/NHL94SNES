; Unidentified routine.
CODE_9C95A1:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9C95B0
	lda.w #$0003
	bra CODE_9C9617
