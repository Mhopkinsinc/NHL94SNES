; Pause menu Player Stats
PausePlayerStats:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	jsl.l ShowPlayerStats
	jsl.l ReloadRink
	jmp.w PauseSubmenuDone
