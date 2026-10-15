; Pause menu: toggle defensive control
PauseDefControl:
	lda.b d1
	bit.w #$8380
	beq PauseDefStore
	jsl.l GetPadTeam
	ldy.b a2
	lda.w defcontrol,y
	eor.w #$0001
	sta.w defcontrol,y
PauseDefStore:
	jmp.w PauseMenuPoll
