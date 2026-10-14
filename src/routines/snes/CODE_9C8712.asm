; Unidentified routine.
CODE_9C8712:
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DB9
	lda.w #$0001
	sta.w $1DF3
CODE_9C8729:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne CODE_9C8729
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9C8644
