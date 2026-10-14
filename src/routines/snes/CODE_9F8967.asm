; Unidentified routine.
CODE_9F8967:
	txa
	lsr a
	sta.b d6
	cpx.w $0AD9
	bne CODE_9F897E
	lda.w sfhormode
	bne CODE_9F897E
	lda.w #$0000
	sta.b d4
	jsl.l CODE_9BC174
CODE_9F897E:
	cpx.w #$0018
	bcs CODE_9F89B2
	lda.w $19D4,x
	bmi CODE_9F89B2
	tay
	lda.w $0ADD,y
	bne CODE_9F89B2
	lda.w #$0001
	sta.w $0ADD,y
	lda.w JoyPad,y
	sta.b d3
	lda.w $0AAE,y
	sta.b d2
	lda.w $0AB8,y
	sta.b d1
	lda.w $0AA4,y
	sta.b d0
	iny
	iny
	sty.b d4
	jsl.l CODE_9FC1B9
	bra CODE_9F89B2
