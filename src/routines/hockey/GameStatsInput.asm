; Game stats input. Start leaves, up and down scroll the rows.
GameStatsInput:
	jsl.l WaitFrame
	jsl.l ReadPausePad
	lda.b d3
	bit.w #$1000
	beq .t1
	jmp.w GameStatsRtl

.t1:
	bit.w #$0800
	beq .t2
.1:
	jmp.w ScrollGameStatsUp

.t2:
	bit.w #$0400
	beq .t1x
	jmp.w ScrollGameStatsDown

.t1x:
	bra GameStatsInput
; Game stats: Start leaves, up / down scroll, else MarkGameStatRows; the scroll routines come back here
GameStatsKeys:
	jsl.l ReadPausePad
	lda.b d3
	bit.w #$1000
	bne GameStatsRtl
	bit.w #$0800
	bne ScrollGameStatsUp
	bit.w #$0400
	beq MarkGameStatRows
	jmp.w ScrollGameStatsDown
