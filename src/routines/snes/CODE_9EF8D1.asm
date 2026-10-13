; Unidentified routine.
CODE_9EF8D1:
	lda.w tmsort,y
	sta.b $89
	lda.w #$0005
	sta.b $A9
CODE_9EF8DB:
	ldy.b $89
	lda.w position,y
	bmi CODE_9EF8F4
	lda.w Ypos,y
	sta.b $A5
	lda.w pfgoal,y
	bne CODE_9EF8F4
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EF8F4:
	inc.b $89
	inc.b $89
	lda.b $A5
	sec
	sbc.w #$0058
	bmi CODE_9EF903
	jmp.w $F829
