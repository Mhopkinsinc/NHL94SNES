; Scroll the other-scores list down one page.
ScrollOtherScoresDown:
	jsr.w ClearOtherScoreBraces
	lda.w #$0006
	sta.w $1DC5
	jsl.l DrawOtherScoresPage
	lda.w #$0005
	sta.w $1DC5
	lda.w $1DBD
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi .t2
	jmp.w CODE_9BC2E4

.t2:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
	cmp.l $7E35D6
	bne .2
.1:
	clc
	adc.w #$0005
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bmi .t1
	jmp.w CODE_9BC2E4

.t1:
	sec
	sbc.w #$0004
	sec
	sbc.w $1DE9
.2:
	sta.w $1DBD
	lda.w #$0001
	sta.w $1DF3
	lda.w #$0018
	sta.w $1DF5
.loop:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$0017
	bne .loop
	jsl.l DrawOtherScoresPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9BC2C9
