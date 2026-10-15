; Pause menu Game Stats
PauseGameStats:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	jsl.l ShowGameStats
	jsl.l ReloadRink
	bra PauseSubmenuDone
