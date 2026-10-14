; Unidentified routine.
CODE_9ED5F9:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	lda.w $0AD9
	bmi CODE_9ED640
	lsr a
	tay
	lda.w pfteam,y
	cmp.w pfteam,x
	beq CODE_9ED673
	lda.w $0BEB,x
	bne CODE_9ED673
	jsl.l RandomWord
	cmp.w #$0A00
	bcs CODE_9ED673
	lda.w $0B1D,x
	cmp.w #$0023
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	jmp.w CODE_9ED58D
