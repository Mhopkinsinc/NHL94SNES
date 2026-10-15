; Scroll the scoring summary up one page.
ScrollScoringUp:
	lda.w listtop
	dec a
	bmi ScoringSummaryWait
	sta.w listtop
	lda.w #$0006
	sta.w listrows
	jsr.w DrawScoringPage
	jsl.l WaitFrame
	lda.w #$0015
	sta.w irqvscroll1
	lda.w #$0018
	sta.w irqvscroll2
.loop:
	jsl.l WaitFrame
	dec.w irqvscroll1
	dec.w irqvscroll1
	lda.w irqvscroll1
	cmp.w #$0001
	bne .loop
	jsl.l PrintScrollArrows
	lda.w #$0005
	sta.w listrows
	jsr.w DrawScoringPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w irqvscroll1
	jmp.w ScoringSummaryLoop
