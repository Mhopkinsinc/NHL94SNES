; Unidentified routine.
CODE_9EAF67:
	cpy.b $14
	bpl CODE_9EAF70
	lda.w #$0008
	sta.b tmp1
CODE_9EAF70:
	cpx.b $16
	bmi CODE_9EAF4E
	lda.w #$0002
	sta.b tmp0
	cpy.b $16
	bpl CODE_9EAF4D
CODE_9EAF7D:
	ldx.b $0C
	ldy.b $10
	cpx.w #$0024
	bmi CODE_9EAF59
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$0024
	bpl CODE_9EAF4D
CODE_9EAF92:
	cpx.w #$FFDC
	bpl .2
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFDC
	bmi CODE_9EAF4D
.1:
	inc.b tmp2
	rts
.2:
	cpy.w #$FFDC
	bpl .1
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
