; Pause menu Crowd Level
PauseCrowdLevel:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	jsl.l ShowCrowdMeter
	jsl.l ReloadRink
	jmp.w PauseSubmenuDone
