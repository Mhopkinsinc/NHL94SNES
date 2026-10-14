; Unidentified routine.
CODE_9C8E22:
	jsl.l CODE_9B851F
	lda.b d3
	bit.w #$1000
	bne CODE_9C8E9B
	bit.w #$0800
	bne ScrollGameStatsUp
	bit.w #$0400
	beq MarkGameStatRows
	jmp.w ScrollGameStatsDown
