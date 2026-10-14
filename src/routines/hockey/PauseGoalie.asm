; Pause menu: cycle the goalie
PauseGoalie:
	jsl.l CODE_9FC76C
	jsl.l GoalieCount
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.b d1
	bit.w #$8180
	bne CODE_9FE3EB
	bit.w #$0200
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w tmgoalie,y
	bmi CODE_9FE3E7
CODE_9FE3DC:
	dec a
CODE_9FE3DD:
	sta.w tmgoalie,y
	jsl.l setpersonel
	jmp.w PauseMenuPoll
CODE_9FE3E7:
	lda.b d0
	bra CODE_9FE3DC
