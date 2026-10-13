; Unidentified routine.
assdefd:
	ldy.w puckc
	bmi CODE_9E8631
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8631
	lda.w #$0001
	sta.b $A5
	jmp.w $8C18
