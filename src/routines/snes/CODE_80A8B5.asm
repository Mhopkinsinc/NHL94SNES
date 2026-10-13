; Unidentified routine.
CODE_80A8B5:
	cpy.b #$DB
	bne CODE_80A8C1
	lda.w $0826,x
	sta.w $0804,x
	bra CODE_80A877
