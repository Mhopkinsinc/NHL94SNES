; Clear team a2's offsides flag once none of its skaters is past the blue line
ClearOffsidesIfAllPlayers:
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9EF8D1
	jmp.w CODE_9EF829
