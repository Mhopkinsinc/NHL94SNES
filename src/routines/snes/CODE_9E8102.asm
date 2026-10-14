; Unidentified routine.
CODE_9E8102:
	ldy.w shotPlIdx
	bmi CODE_9E8136
	lda.w position,y
	bne CODE_9E8136
	lda.w $0D71
	sta.b d0
	lda.w #$0058
	ldy.w pfgoal,x
	bne .1
	lda.w #$FFA8
.1:
	sta.b d1
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jsl.l CODE_9EA5A4
	jmp.w check4check
