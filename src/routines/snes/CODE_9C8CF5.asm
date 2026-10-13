; Unidentified routine.
CODE_9C8CF5:
	sep #$20
	lda.w $198A,y
	cmp.w $198A,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
CODE_9C8D03:
	lda.w #$0000
	sta.w $1DC9
	bra CODE_9C8D11
