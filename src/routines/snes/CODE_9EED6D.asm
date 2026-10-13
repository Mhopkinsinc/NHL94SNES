; Unidentified routine.
CODE_9EED6D:
	stz.w $0BA5
	stz.w passdir
	lda.w pfgoal,x
	bne CODE_9EED84
	lda.w #$000C
	sta.w $0BA5
	lda.w #$0004
	sta.w passdir
CODE_9EED84:
	rtl
