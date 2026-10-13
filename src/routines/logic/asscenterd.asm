; Unidentified routine.
asscenterd:
	ldy.w puckc
	bmi CODE_9E858C
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E858C
	lda.w #$0006
	sta.b $A5
	jmp.w $8C18
