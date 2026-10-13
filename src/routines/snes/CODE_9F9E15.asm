; Unidentified routine.
CODE_9F9E15:
	lda.b $A5
CODE_9F9E17:
	cmp.w #$0064
	bcc CODE_9F9E21
	sbc.w #$0064
	bra CODE_9F9E17
