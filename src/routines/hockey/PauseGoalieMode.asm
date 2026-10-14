; Pause menu: toggle the goalie control
PauseGoalieMode:
	lda.b d1
	bit.w #$8380
	beq .1
	jsl.l GetPadTeam
	ldy.b a2
	lda.w $1C90,y
	eor.w #$0001
	sta.w $1C90,y
.1:
	jmp.w PauseMenuPoll
