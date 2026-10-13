; Unidentified routine.
CODE_9E8102:
	ldy.w puckc
	bmi CODE_9E8136
	lda.w position,y
	bne CODE_9E8136
	lda.w puckx
	sta.b $A5
	lda.w #$0058
	ldy.w pfgoal,x
	bne CODE_9E811C
	lda.w #$FFA8
CODE_9E811C:
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
