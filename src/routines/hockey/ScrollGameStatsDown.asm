; Scroll the game stats down one row.
ScrollGameStatsDown:
	jsr.w ClearGameStatBraces
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	bmi .t2
	jmp.w MarkGameStatRows

.t2:
	inc.w $1DC5
	jsr.w CODE_9C8F7D
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DBD
	lda.w #$0001
	sta.w $1DF3
.loop:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne .loop
	jsr.w CODE_9C8F7D
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w GameStatsKeys

.t1:
	lda.w #$0000
	sta.w $1DCD
.loopx:
	lda.w $1DCD
	cmp.w #$FFFF
	bne .loopx
	rts
