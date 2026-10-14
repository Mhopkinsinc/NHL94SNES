; Pause menu Player Cards
PausePlayerCards:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w CODE_9FE19E

.t1:
	jsl.l CODE_9DBD4F
	jsl.l CODE_9FE79F
	jmp.w PauseSubmenuDone
