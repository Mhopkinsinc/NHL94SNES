; Unidentified routine.
CODE_9FC693:
	lda.w gsp
	cmp.w #$0003
	bmi CODE_9FC6A6
	lda.l $7E34BC
	bne CODE_9FC6A6
	lda.w #$012C
	sta.b $A5
CODE_9FC6A6:
	lda.b $A5
	sta.w gameclock
	sta.w $1C82
	sta.w $15D6
	rtl
