; Unidentified routine.
CODE_9BC3A0:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
CODE_9BC3A8:
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9BC3B7:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne CODE_9BC3B7
	jsl.l CODE_9BC44B
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9BC2C9
