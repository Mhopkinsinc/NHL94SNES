; Pause menu Exit Game
PauseExitGame:
	lda.b d1
	bit.w #$8080
	bne .t2
	jmp.w PauseMenuPoll

.t2:
	jsl.l AskExitGame
	cmp.w #$0000
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	stz.w $07C6
	jml.l Restart
