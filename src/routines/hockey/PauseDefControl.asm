; Pause menu: toggle defensive control
PauseDefControl:
	lda.b d1
	bit.w #$8380
	beq PauseDefStore
	jsl.l GetPadTeam
	ldy.b a2
	lda.w $1C94,y
	eor.w #$0001
	sta.w $1C94,y
PauseDefStore:
	jmp.w PauseMenuPoll
