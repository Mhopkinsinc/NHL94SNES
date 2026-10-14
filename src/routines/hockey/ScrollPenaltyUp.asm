; Scroll the penalty summary up one page.
ScrollPenaltyUp:
	lda.w $1DBD
	dec a
	bmi CODE_9B9822
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsr.w DrawPenaltyPage
	jsl.l WaitFrame
	lda.w #$0015
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
.loop:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne .loop
	jsl.l PrintScrollArrows
	lda.w #$0005
	sta.w $1DC5
	jsr.w DrawPenaltyPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9B9808
