; Assignment: a wing on offense skates to a spot in the zone of the puck
asswingo:
	cpx.w shotPlIdx
	beq CODE_9E8A88
	ldy.w shotPlIdx
	bmi CODE_9E8A90
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8A90
	lda.w #$0003
	sta.b d0
	jmp.w assreplace
