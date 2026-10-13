; Unidentified routine.
CODE_80B044:
	cmp.w #$0000
	bpl CODE_80B053
CODE_80B049:
	pla
	sta.b $14
	lda.w #$FFFF
	sta.w $07C0
	rts
