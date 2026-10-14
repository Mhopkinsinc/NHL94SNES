; Unidentified routine.
CODE_9EAD81:
	cpy.b $14
	bpl CODE_9EAD8A
	lda.w #$0008
	sta.b tmp1
CODE_9EAD8A:
	cpx.b $16
	bmi CODE_9EAD68
	lda.w #$0002
	sta.b tmp0
	cpy.b $16
	bpl CODE_9EAD67
CODE_9EAD97:
	ldx.b $0C
	ldy.b $10
	cpx.w #$002C
	bmi CODE_9EAD73
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$002C
	bpl CODE_9EAD67
CODE_9EADAC:
	cpx.w #$FFD4
	bpl .2
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFD4
	bmi CODE_9EAD67
.1:
	inc.b tmp2
	rts
.2:
	cpy.w #$FFD4
	bpl .1
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
