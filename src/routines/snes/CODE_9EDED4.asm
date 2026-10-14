; Unidentified routine.
CODE_9EDED4:
	lda.w gmclock
	bne CODE_9EDEE4
	lda.w gameclock
	cmp.w #$0005
	bcs CODE_9EDEE4
	jmp.w CompShoot
