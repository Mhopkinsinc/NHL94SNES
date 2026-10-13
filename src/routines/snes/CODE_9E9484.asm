; Unidentified routine.
CODE_9E9484:
	lda.w pflags,x
	bit.w #$8000
	bne CODE_9E9491
	cpx.w #$0018
	bcc CODE_9E9492
CODE_9E9491:
	rtl
