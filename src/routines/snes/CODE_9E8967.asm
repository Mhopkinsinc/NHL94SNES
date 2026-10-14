; Unidentified routine.
CODE_9E8967:
	rtl
	ldy.w $0AD9
	bmi CODE_9E8981
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8981
	lda.w #$0004
	sta.b $A5
	jmp.w CODE_9E8C18
