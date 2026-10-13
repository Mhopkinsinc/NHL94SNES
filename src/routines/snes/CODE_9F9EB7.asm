; Unidentified routine.
CODE_9F9EB7:
	phx
	ldx.b $89
	lda.l $7E3568,x
	cmp.w #$0004
	bcc CODE_9F9EC6
	jmp.w $9F8F
