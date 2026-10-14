; Scroll the other-scores list up one page.
ScrollOtherScoresUp:
	jsr.w CODE_9BC4F3
	lda.w $1DBD
	dec a
	bpl .t2
	jmp.w CODE_9BC2E4

.t2:
	cmp.l $7E35D6
	bne CODE_9BC3F5
	cmp.w #$0000
	bne .t1
	jmp.w CODE_9BC2E4

.t1:
	dec a
CODE_9BC3F5:
	sta.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	jsl.l DrawOtherScoresPage
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
	lda.w #$0005
	sta.w $1DC5
	jsl.l DrawOtherScoresPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9BC2C9
