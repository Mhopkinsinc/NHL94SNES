; Pause menu Scoring Summary
PauseScoringSummary:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l CODE_9B93F3
	jsl.l CODE_9FE79F
	jmp.w PauseSubmenuDone
