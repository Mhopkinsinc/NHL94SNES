; Unidentified routine.
CODE_9EAF67:
	cpy.b $14
	bpl CODE_9EAF70
	lda.w #$0008
	sta.b $C7
CODE_9EAF70:
	cpx.b $16
	bmi CODE_9EAF4E
	lda.w #$0002
	sta.b $C5
	cpy.b $16
	bpl CODE_9EAF4D
CODE_9EAF7D:
	ldx.b $0C
	ldy.b $10
	cpx.w #$0024
	bmi CODE_9EAF59
	lda.b $C5
	ora.w #$0004
	sta.b $C5
	cpy.w #$0024
	bpl CODE_9EAF4D
CODE_9EAF92:
	cpx.w #$FFDC
	bpl CODE_9EAFA6
	lda.b $C5
	ora.w #$0010
	sta.b $C5
	cpy.w #$FFDC
	bmi CODE_9EAF4D
CODE_9EAFA3:
	inc.b $C9
	rts
