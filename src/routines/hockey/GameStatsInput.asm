; Game stats input. Start leaves, up and down scroll the rows.
GameStatsInput:
	jsl.l WaitFrame
	jsl.l CODE_9B851F
	lda.b d3
	bit.w #$1000
	beq .t1
	jmp.w CODE_9C8E9B

.t1:
	bit.w #$0800
	beq .t2
.1:
	jmp.w ScrollGameStatsUp

.t2:
	bit.w #DMA_OAM
	beq .t1x
	jmp.w ScrollGameStatsDown

.t1x:
	bra GameStatsInput
