; Unidentified routine.
CODE_9B9828:
	lda.w #$0006
	sta.w $1DC5
	jsr.w CODE_9B98C9
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl CODE_9B9822
	sec
	sbc.w #$0004
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
CODE_9B9856:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne CODE_9B9856
	jsl.l CODE_9B9AB2
	jsr.w CODE_9B98C9
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	bra CODE_9B9808
