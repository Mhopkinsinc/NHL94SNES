; Unidentified routine.
CODE_9EE161:
	lda.w $1003,x
	sta.b d0
	stz.b d2
	lda.w $10A3,x
	sec
	sbc.b d7
	sta.w $10A3,x
	bpl ShotMode
	lda.w #$0080
	tsb.b d2
	bra ShotMode
