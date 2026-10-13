; Unidentified routine.
CODE_9EED24:
	lda.w $0B77
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0008
	sta.w $0BA5
	rtl
