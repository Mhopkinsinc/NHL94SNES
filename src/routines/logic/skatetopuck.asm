; Player X skates to the puck, slowing down near it
skatetopuck:
	jsl.l skatetopuckinit
	lda.w $1023,x
	sec
	sbc.b d7
	sta.w $1023,x
	bmi CODE_9EAFC7
	jmp.w CODE_9EB070
