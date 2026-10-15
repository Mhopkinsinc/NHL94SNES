; Pause menu Edit Lines
PauseEditLines:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w #$0001
	sta.l pausesubmenu
	jsl.l EditLinesScreen
	lda.w #$0000
	sta.l pausesubmenu
	jsl.l ReloadRink
	bra PauseSubmenuDone
