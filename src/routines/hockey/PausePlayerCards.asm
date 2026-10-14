; Pause menu Player Cards
PausePlayerCards:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	jsl.l ShowPlayerCards
	jsl.l CODE_9FE79F
	jmp.w PauseSubmenuDone
