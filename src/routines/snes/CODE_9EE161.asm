; Unidentified routine.
CODE_9EE161:
	lda.w temp1,x
	sta.b $A5
	stz.b $AD
	lda.w temp2b,x
	sec
	sbc.b $C1
	sta.w temp2b,x
	bpl ShotMode
	lda.w #$0080
	tsb.b $AD
	bra ShotMode
