; Assignment: a wing on defense covers his side between the puck and the goal
asswingd:
	ldy.w shotPlIdx
	bmi CODE_9E8981
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8981
	lda.w #$0004
	sta.b d0
	jmp.w assreplace
