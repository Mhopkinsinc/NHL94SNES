; Start a shot by player X: shot mode, aim at the goal, shot animation
SetShotMode:
	lda.w #$0008
	sta.w passdir
	lda.w #$0008
	tsb.w sflags
	stz.b d0
	lda.w #$0128
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9EE197
	lda.w #$FED8
	sta.b d1
CODE_9EE197:
	lda.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.w #$000F
	sta.w passspeed
	ldy.w #$ED4A
	jsl.l Findhittype
	beq CODE_9EE1BD
	ldy.w #$EE5C
CODE_9EE1BD:
	sty.b d1
	jml.l SetSPA
