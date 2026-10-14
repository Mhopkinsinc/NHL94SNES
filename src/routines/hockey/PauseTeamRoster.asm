; Pause menu Team Roster
PauseTeamRoster:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	jsl.l TeamRoster
	jsl.l ReloadRink
	bra PauseSubmenuDone
