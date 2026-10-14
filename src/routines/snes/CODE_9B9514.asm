; Unidentified routine.
CODE_9B9514:
	lda.w $1DBD
	dec a
	bmi CODE_9B94BB
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsr.w CODE_9B9562
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B9536:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9B9536
	jsl.l CODE_9B9AB2
	lda.w #$0005
	sta.w $1DC5
	jsr.w CODE_9B9562
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9B94A5
