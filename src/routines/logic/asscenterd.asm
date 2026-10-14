; Assignment: the center on defense, halfway between the puck and his goal
asscenterd:
	ldy.w shotPlIdx
	bmi CODE_9E858C
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E858C
	lda.w #$0006
	sta.b d0
	jmp.w assreplace
