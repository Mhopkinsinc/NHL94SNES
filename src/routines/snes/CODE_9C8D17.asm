; Unidentified routine.
CODE_9C8D17:
	cmp.w $1DF9
	beq .t1
	lda.w #$2400
	sta.w $0D0D
	bra CODE_9C8D2A

.t1:
	lda.w #$2000
	sta.w $0D0D
CODE_9C8D2A:
	rtl
