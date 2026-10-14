; Unidentified routine.
CODE_9E85F6:
	lda.w #$0058
	sec
	sbc.w pucky
	bmi CODE_9E860B
	lda.b $A9
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b $A9
CODE_9E860B:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jmp.w CODE_9EA5A4
	ldy.w $0AD9
	bmi CODE_9E8631
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E8631
	lda.w #$0001
	sta.b $A5
	jmp.w assreplace
