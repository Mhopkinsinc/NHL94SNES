; Unidentified routine.
CODE_80B2EE:
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$0007
	bra CODE_80B300
