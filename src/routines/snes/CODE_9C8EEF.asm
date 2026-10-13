; Unidentified routine.
CODE_9C8EEF:
	inc.w $1DC5
	jsr.w CODE_808F7D
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DBD
	lda.w #$0001
	sta.w $1DF3
CODE_9C8F05:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne CODE_9C8F05
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8E22
