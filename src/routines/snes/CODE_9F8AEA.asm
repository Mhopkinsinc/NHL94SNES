; Unidentified routine.
CODE_9F8AEA:
	lda.w $0DF9
	cmp.w #$0018
	bcs CODE_9F8B24
	lda.w puckx
	cmp.w #$FF78
	bpl CODE_9F8B0B
	lda.w #$FF78
	sta.w puckx
	ldx.w $0DB3
	cpx.w #$018C
	bne CODE_9F8B0B
	sta.w $0D73
CODE_9F8B0B:
	lda.w puckx
	cmp.w #$0088
	bmi CODE_9F8B24
	lda.w #$0088
	sta.w puckx
	ldx.w $0DB3
	cpx.w #$018C
	bne CODE_9F8B24
	sta.w $0D73
CODE_9F8B24:
	lda.w $0DF9
	bne CODE_9F8B58
	lda.w pucky
	cmp.w #$FEC2
	bmi CODE_9F8B58
	cmp.w #$013E
	bpl CODE_9F8B58
	lda.w pucky
	cmp.w #$FEDB
	bpl CODE_9F8B47
	lda.w #$FEDB
	sta.w pucky
	sta.w $0DD5
CODE_9F8B47:
	lda.w pucky
	cmp.w #$012A
	bmi CODE_9F8B58
	lda.w #$012A
	sta.w pucky
	sta.w $0DD5
CODE_9F8B58:
	lda.w puckc
	bmi CODE_9F8B64
	lda.w pucky
	sta.l $7E30F4
CODE_9F8B64:
	rtl
