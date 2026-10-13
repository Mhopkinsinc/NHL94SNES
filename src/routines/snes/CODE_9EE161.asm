; Unidentified routine.
CODE_9EE161:
	lda.w $1003,x
	sta.b $A5
	stz.b $AD
	lda.w $10A3,x
	sec
	sbc.b $C1
	sta.w $10A3,x
	bpl ShotMode
	lda.w #$0080
	tsb.b $AD
	bra ShotMode
