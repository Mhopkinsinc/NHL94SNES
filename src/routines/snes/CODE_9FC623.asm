; Unidentified routine.
CODE_9FC623:
	lda.b $A5
	pha
	lda.b $A9
	cmp.w #$0002
	bne CODE_9FC63B
	lda.b $A5
CODE_9FC62F:
	cmp.w #$0064
	bcc CODE_9FC639
	sbc.w #$0064
	bra CODE_9FC62F
