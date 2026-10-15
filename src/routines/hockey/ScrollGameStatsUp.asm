; Scroll the game stats up one row.
ScrollGameStatsUp:
	jsr.w ClearGameStatBraces
	lda.w listtop
	dec a
	bmi MarkGameStatRows
	sta.w listtop
	inc.w listrows
	jsr.w SendGameStatsPage
	dec.w listrows
	jsl.l WaitFrame
	lda.w #$000D
	sta.w irqvscroll1
.loop:
	jsl.l WaitFrame
	dec.w irqvscroll1
	dec.w irqvscroll1
	lda.w irqvscroll1
	cmp.w #$0001
	bne .loop
	jsr.w SendGameStatsPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w irqvscroll1
	jmp.w GameStatsKeys
