; Unidentified routine.
CODE_9C937D:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9C938C
	lda.w #$0006
	bra CODE_9C93E5
