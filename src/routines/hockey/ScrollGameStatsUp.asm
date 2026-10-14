; Scroll the game stats up one row.
ScrollGameStatsUp:
	jsr.w ClearGameStatBraces
	lda.w $1DBD
	dec a
	bmi MarkGameStatRows
	sta.w $1DBD
	inc.w $1DC5
	jsr.w CODE_9C8F7D
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
.loop:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne .loop
	jsr.w CODE_9C8F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9C8E22
