; Unidentified routine.
CODE_9FC623:
	lda.b d0
	pha
	lda.b d1
	cmp.w #$0002
	bne PushNumberWidth
	lda.b d0
CODE_9FC62F:
	cmp.w #$0064
	bcc CODE_9FC639
	sbc.w #$0064
	bra CODE_9FC62F
