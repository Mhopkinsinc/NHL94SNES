; Unidentified routine.
CODE_9EED59:
	lda.w $0B75
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0014
	sta.w $0BA5
	rtl
