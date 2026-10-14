; Unidentified routine.
CODE_9BC3F4:
	dec a
CODE_9BC3F5:
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9BC412:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9BC412
	lda.w #$0005
	sta.w $1DC5
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9BC2C9
