; Unidentified routine.
CODE_9EF8D1:
	lda.w tmsort,y
	sta.b a0
	lda.w #$0005
	sta.b d1
CODE_9EF8DB:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EF8F4
	lda.w Ypos,y
	sta.b d0
	lda.w pfgoal,y
	bne CODE_9EF8F4
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9EF8F4:
	inc.b a0
	inc.b a0
	lda.b d0
	sec
	sbc.w #$0058
	bmi CODE_9EF903
	jmp.w CODE_9EF829
