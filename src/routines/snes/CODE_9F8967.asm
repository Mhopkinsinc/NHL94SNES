; Unidentified routine.
CODE_9F8967:
	txa
	lsr a
	sta.b $BD
	cpx.w puckc
	bne CODE_9F897E
	lda.w sfhormode
	bne CODE_9F897E
	lda.w #$0000
	sta.b $B5
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
	lda.w $0776,y
	sta.b $B1
	lda.w $0AAE,y
	sta.b $AD
	lda.w $0AB8,y
	sta.b $A9
	lda.w $0AA4,y
	sta.b $A5
	iny
	iny
	sty.b $B5
	jsl.l CODE_9FC1B9
	bra CODE_9F89B2
