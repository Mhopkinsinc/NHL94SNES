; Pause menu: cycle the goalie
PauseGoalie:
	jsl.l CODE_9FC76C
	jsl.l GoalieCount
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.b d1
	bit.w #$8180
	bne .4
	bit.w #$0200
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w tmgoalie,y
	bmi .3
.1:
	dec a
.2:
	sta.w tmgoalie,y
	jsl.l setpersonel
	jmp.w PauseMenuPoll
.3:
	lda.b d0
	bra .1
.4:
	lda.w tmgoalie,y
	bmi .t1x
	inc a
	cmp.b d0
	bcc .2
	lda.w #$FFFF
	bra .2

.t1x:
	lda.w #$0000
	bra .2
