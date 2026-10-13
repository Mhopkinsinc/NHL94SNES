; Unidentified routine.
chkprogress:
	lda.w gmode
	bit.w #$0004
	bne CODE_9EB3C5
CODE_9EB3C4:
	rtl
