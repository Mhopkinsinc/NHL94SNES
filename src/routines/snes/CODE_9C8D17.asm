; Unidentified routine.
CODE_9C8D17:
	cmp.w $1DF9
	beq CODE_9C8D24
	lda.w #$2400
	sta.w $0D0D
	bra CODE_9C8D2A
