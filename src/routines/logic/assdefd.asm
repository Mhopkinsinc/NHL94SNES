; Assignment: a defenseman on defense stays between the furthest attacker and his goal
assdefd:
	ldy.w puckc
	bmi CODE_9E8631
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8631
	lda.w #$0001
	sta.b d0
	jmp.w assreplace
