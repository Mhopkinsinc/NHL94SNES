; Scroll the other-scores list down one page.
ScrollOtherScoresDown:
	jsr.w ClearOtherScoreBraces
	lda.w #$0006
	sta.w listrows
	jsl.l DrawOtherScoresPage
	lda.w #$0005
	sta.w listrows
	lda.w listtop
	clc
	adc.w #$0005
	clc
	adc.w otherskip
	cmp.w listend
	bmi .t2
	jmp.w OtherScoresNext

.t2:
	sec
	sbc.w #$0004
	sec
	sbc.w otherskip
	cmp.l gamenum
	bne .2
.1:
	clc
	adc.w #$0005
	clc
	adc.w otherskip
	cmp.w listend
	bmi .t1
	jmp.w OtherScoresNext

.t1:
	sec
	sbc.w #$0004
	sec
	sbc.w otherskip
.2:
	sta.w listtop
	lda.w #$0001
	sta.w irqvscroll1
	lda.w #$0018
	sta.w irqvscroll2
.loop:
	jsl.l WaitFrame
	inc.w irqvscroll1
	inc.w irqvscroll1
	lda.w irqvscroll1
	cmp.w #$0017
	bne .loop
	jsl.l DrawOtherScoresPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w irqvscroll1
	jmp.w OtherScoresLoop
