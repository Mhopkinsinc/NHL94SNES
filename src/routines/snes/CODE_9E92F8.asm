; Unidentified routine.
CODE_9E92F8:
	lda.w pflags,x
	bit.w #$8000
	bne CODE_9E9305
	cpx.w #$0017
	bcc CODE_9E9306
CODE_9E9305:
	rtl
