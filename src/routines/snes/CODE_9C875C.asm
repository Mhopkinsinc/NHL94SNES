; Unidentified routine.
CODE_9C875C:
	sta.w $1DB9
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
CODE_9C8773:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne CODE_9C8773
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w $8644
