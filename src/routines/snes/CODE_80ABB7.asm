; Unidentified routine.
CODE_80ABB7:
	sta.w $0848,x
	lda.b $4C
	sta.w $0804,x
CODE_80ABBF:
	dec.w $0848,x
CODE_80ABC2:
	sep #$30
	ldx.b $4A
	rts
